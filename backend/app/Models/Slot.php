<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Slot extends Model
{
    use HasFactory;

    public $timestamps = false;

    protected $fillable = [
        'course_id',
        'start_time',
        'end_time',
        'day',
    ];

    public function courses()
    {
        return $this->HasMany(Course::class);
    }
}
