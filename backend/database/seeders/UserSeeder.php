<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        User::create([
            'name' => 'Mario Rossi',
            'email' => 'mario@example.com',
            'password' => bcrypt('password'),
            'role' => 'user', // Aggiunta del ruolo
            'profile_img' => '', // Aggiunta dell'immagine del profilo
        ]);

        User::create([
            'name' => 'Frank',
            'email' => 'admin@admin.it',
            'password' => bcrypt('password'),
            'role' => 'admin', // Aggiunta del ruolo
            'profile_img' => '', // Aggiunta dell'immagine del profilo
        ]);

        User::Factory(10)->create();
    }
}
