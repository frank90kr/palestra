<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Course;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class UserController extends Controller
{
    public function subscribe(Request $request)
    {
        $userId = Auth::id();
        $courseId = $request->input('course_id');

        // Verifica se l'utente è già iscritto al corso
        $isSubscribed = User::find($userId)->courses()->where('course_id', $courseId)->exists();
        if ($isSubscribed) {
            return response()->json(['success' => false, 'message' => 'Utente già iscritto a questo corso'], 400);
        }

        // Se l'utente non è già iscritto, procedi con l'iscrizione
        User::find($userId)->courses()->attach($courseId, ['status' => 'pending']);

        return response()->json(['success' => true, 'message' => 'Subscribed successfully']);
    }

    public function unsubscribe($courseId)
    {
        $userId = Auth::id();

        // Rimuovi l'iscrizione al corso per l'utente
        User::find($userId)->courses()->detach($courseId);

        return response()->json(['success' => true, 'message' => 'Unsubscribed successfully']);
    }

    public function profile()
    {
        $userId = Auth::id();
        $user = User::find($userId);

        $courses = $user->courses()->withPivot('status')->get();

        return response()->json($courses);
    }

    // Metodo Admin

    public function adminViewSubscriptions()
    {
        // Verifica se l'utente autenticato è un amministratore
        $user = User::find(Auth::id());
        if (!$user->isAdmin()) {
            return response()->json(['success' => false, 'message' => 'Non sei autorizzato ad accedere a questa risorsa'], 403);
        }

        // Recupera tutte le iscrizioni dei corsi
        $subscriptions = Course::with('users', 'slot', 'activity')->get();

        return response()->json(['success' => true, 'subscriptions' => $subscriptions]);
    }

    public function acceptSubscription(Request $request, $userId, $courseId)
    {
        $user = User::find($userId);
        if (!$user) {
            return response()->json(['success' => false, 'message' => 'Utente non trovato'], 404);
        }

        $course = Course::find($courseId);
        if (!$course) {
            return response()->json(['success' => false, 'message' => 'Corso non trovato'], 404);
        }

        // Verifica se l'utente è iscritto al corso e se lo stato è 'pending'
        $isPending = $user->courses()->where('course_id', $courseId)->wherePivot('status', 'pending')->exists();
        if (!$isPending) {
            return response()->json(['success' => false, 'message' => 'L\'utente non ha un\'iscrizione pendente per questo corso'], 400);
        }

        // Accetta l'iscrizione cambiando lo stato da 'pending' a 'accepted'
        $user->courses()->updateExistingPivot($courseId, ['status' => 'accepted']);

        return response()->json(['success' => true, 'message' => 'Iscrizione accettata con successo']);
    }

    public function cancelSubscription(Request $request, $userId, $courseId)
    {
        $user = User::find($userId);
        if (!$user) {
            return response()->json(['success' => false, 'message' => 'Utente non trovato'], 404);
        }

        $course = Course::find($courseId);
        if (!$course) {
            return response()->json(['success' => false, 'message' => 'Corso non trovato'], 404);
        }

        // Verifica se l'utente è iscritto al corso e se lo stato è diverso da 'rejected'
        $isSubscribed = $user->courses()->where('course_id', $courseId)->where('status', '<>', 'rejected')->exists();
        if (!$isSubscribed) {
            return response()->json(['success' => false, 'message' => 'L\'utente non è iscritto a questo corso o l\'iscrizione è già stata cancellata'], 400);
        }

        // Cancella l'iscrizione cambiando lo stato da 'pending' o 'accepted' a 'rejected'
        $user->courses()->updateExistingPivot($courseId, ['status' => 'rejected']);

        return response()->json(['success' => true, 'message' => 'Iscrizione cancellata con successo']);
    }
}
