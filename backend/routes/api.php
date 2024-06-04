<?php
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;

use App\Http\Controllers\CourseController;
use App\Http\Controllers\ActivityController;

Route::middleware(['auth:sanctum'])->group(function () {
    // Rotte per le attività e i corsi protetti da autenticazione
    Route::get('/user', function (Request $request) {
        return $request->user();
    });

   


    Route::get('/activities', [ActivityController::class, 'index'])->name('activities.index');
    Route::get('/courses', [CourseController::class, 'index'])->name('courses.index');
    Route::get('/courses/{id}', [CourseController::class, 'show'])->name('courses.show');

    Route::get('/profile', [UserController::class, 'profile'])->name('profile');
    // Rotta per sottoscrivere un corso
    Route::post('/subscribe', [UserController::class, 'subscribe'])->name('subscribe');
    // Rotta per annullare l'iscrizione al corso, lato utente
    Route::delete('/unsubscribe/{courseId}', [UserController::class, 'unsubscribe'])->name('unsubscribe');

    //Rotte Admin
    Route::get('/admin/courses', [UserController::class,'AdminViewSubscriptions']);
    Route::post('/admin/users/{userId}/courses/{courseId}/accept', [UserController::class, 'acceptSubscription']);
    
    Route::post('/admin/users/{userId}/courses/{courseId}/cancel', [UserController::class, 'cancelSubscription']);




    
});
