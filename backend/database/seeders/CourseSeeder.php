<?php

namespace Database\Seeders;

use App\Models\Course;
use Illuminate\Database\Seeder;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;

class CourseSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Course::create([
            'title' => 'Corso di Yoga',
            'location' => 'Sala Yoga',
            'activity_id' => 1,
            'slot_id' => 1,
            'description' => 'Lo yoga è un complesso ed immenso corpus teorico-pratico che comprende una filosofia, una cosmogonia, una raffinata psicologia, una mistica, uno studio dettagliato degli stati di coscienza insieme ai mezzi e alle condizioni per realizzarli, un processo spirituale evolutivo',
            
        ]);

        Course::create([
            'title' => 'Corso di Pilates',
            'location' => 'Sala Pilates',
            'activity_id' => 2,
            'slot_id' => 2,
            'description' => 'Il Pilates è una disciplina che combina allenamento fisico ad un metodo di respirazione che ha come obiettivo quello di sollecitare la cintura addominale. Si tratta soprattutto di movimenti lenti e ripetuti per assumere consapevolezza del proprio corpo e allenarlo alla forma fisica',
            
            
        ]);

        Course::create([
            'title' => 'Corso di Zumba',
            'location' => 'Sala Zumba ',
            'activity_id' => 3,
            'slot_id' => 3,
            'description' => 'La Zumba, oppure Zumba Fitness, è una lezione di fitness musicale che si svolge in gruppo seguendo i ritmi e i movimenti della musica'
            
        ]);

        Course::create([
            'title' => 'Corso di Spinning',
            'location' => 'Sala 3 ',
            'activity_id' => 4,
            'slot_id' => 4,
            'description' => 'Lo Spinning è un/attività di gruppo su bicicletta stazionaria'
            
        ]);

        Course::create([
            'title' => 'CrossFit',
            'location' => 'Sala 2 ',
            'activity_id' => 5,
            'slot_id' => 5,
            
        ]);

        Course::create([
            'title' => 'Body Pump',
            'location' => 'Sala 1',
            'activity_id' => 6,
            'slot_id' => 6,
            
        ]);

        Course::create([
            'title' => 'Body Balance',
            'location' => 'Sala 4 ',
            'activity_id' => 7,
            'slot_id' => 7,
           
        ]);

        Course::create([
            'title' => 'HIIT',
            'location' => 'Sala 5 ',
            'activity_id' => 8,
            'slot_id' => 8,
            
        ]);

        Course::create([
            'title' => 'Functional Training',
            'location' => 'Sala 6',
            'activity_id' => 9,
            'slot_id' => 9,
           
        ]);
    }
}
