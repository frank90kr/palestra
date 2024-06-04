<?php

namespace Database\Seeders;

use App\Models\Slot;
use Illuminate\Database\Seeder;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;

class SlotSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Slot::create([
            'course_id' => 1,
            'day' => 'Monday',
            'start_time' => '09:00:00',
            'end_time' => '11:00:00',
        ]);

        Slot::create([
            'course_id' => 2,
            'day' => 'Tuesday',
            'start_time' => '14:00:00',
            'end_time' => '16:00:00',
        ]); 

        Slot::create([
            'course_id' => 3,
            'day' => 'Friday',
            'start_time' => '14:00:00',
            'end_time' => '16:00:00',
        ]);
        
        Slot::create([
            'course_id' => 4,
            'day' => 'Tuesday',
            'start_time' => '14:00:00',
            'end_time' => '16:00:00',
        ]); 

        Slot::create([
            'course_id' => 5,
            'day' => 'Wednesday',
            'start_time' => '14:00:00',
            'end_time' => '16:00:00',
        ]); 

        Slot::create([
            'course_id' => 6,
            'day' => 'Tuesday',
            'start_time' => '14:00:00',
            'end_time' => '16:00:00',
        ]); 

        Slot::create([
            'course_id' => 7,
            'day' => 'Tuesday',
            'start_time' => '14:00:00',
            'end_time' => '16:00:00',
        ]); 

        Slot::create([
            'course_id' => 8,
            'day' => 'Wednesday',
            'start_time' => '18:00:00',
            'end_time' => '20:00:00',
        ]); 

        Slot::create([
            'course_id' => 9,
            'day' => 'Thursday',
            'start_time' => '14:00:00',
            'end_time' => '16:00:00',
        ]); 
    }
}
