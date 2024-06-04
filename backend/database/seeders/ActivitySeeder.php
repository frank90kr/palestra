<?php

namespace Database\Seeders;

use App\Models\Activity;
use Illuminate\Database\Seeder;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;

class ActivitySeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Activity::create([
            'name' => 'Yoga',
            'description' => 'Pratica yoga per migliorare la flessibilità e ridurre lo stress.',
        ]);

        Activity::create([
            'name' => 'Pilates',
            'description' => 'Allenamento di Pilates per rafforzare i muscoli addominali e migliorare la postura.',
        ]);

        Activity::create([
            'name' => 'Zumba',
            'description' => 'Lezione di fitness musicale di gruppo che utilizza i ritmi e i movimenti della musica afro-caraibica, combinati con i movimenti tradizionali dell\'aerobica.',
        ]);
        
        Activity::create([
            'name' => 'Spinning',
            'description' => 'Allenamento su biciclette stazionarie, con musica ritmata e variazioni di intensità.',
        ]);
        
        Activity::create([
            'name' => 'CrossFit',
            'description' => 'Allenamento ad alta intensità che combina sollevamento pesi, esercizi cardiovascolari e ginnastica.',
        ]);
        
        Activity::create([
            'name' => 'Body Pump',
            'description' => 'Allenamento con pesi leggeri e ripetizioni ad alta intensità, mirato a tonificare e scolpire i muscoli di tutto il corpo.',
        ]);

        Activity::create([
            'name' => 'Body Balance',
            'description' => 'Allenamento che combina yoga, tai chi e pilates per migliorare la flessibilità, la forza e la stabilità mentale.',
        ]);
        
        Activity::create([
            'name' => 'HIIT (High-Intensity Interval Training)',
            'description' => 'Allenamento ad alta intensità caratterizzato da brevi raffiche di esercizi intensi seguiti da periodi di recupero.',
        ]);
        
        Activity::create([
            'name' => 'Functional Training',
            'description' => 'Allenamento funzionale che mira a migliorare la forza, la flessibilità e la mobilità utilizzando movimenti che simulano le attività quotidiane.',
        ]);
        
    }
}
