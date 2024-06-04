<?php

namespace Database\Seeders;

use App\Models\User;
use App\Models\Course;
use Illuminate\Database\Seeder;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;

class CourseUserSeeder extends Seeder
{
    public function run()
    {
        $users = User::all();
        $courses = Course::all();

        foreach ($users as $user) {
            $courses_for_user = $courses->random(rand(1, 9));
            foreach ($courses_for_user as $course) {
                $user->courses()->attach($course->id, [
                    'status' => collect(['pending', 'accepted', 'rejected'])->random()
                ]);
            }
        }
    }
}
