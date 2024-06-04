<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Course extends Model
{
    use HasFactory;

    public $timestamps = false;

    protected $fillable = [
        'title',
        'location',
        'activity_id',
        'slot_id',
        'status',
        'image',
    ];

    public function activity()
    {
        return $this->belongsTo(Activity::class);
    }

    public function slot()
    {
        return $this->belongsTo(Slot::class);
    }

    public function users()
    {
        return $this->belongsToMany(User::class)->withPivot('status');
    }
}
