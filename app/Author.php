<?php

namespace App;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

class Author extends Model
{
    protected $fillable = ['name', 'dob'];

    protected $dates = ['dob'];


    public function books()
    {
        return $this->hasMany(Book::class);
    }

    public function setDobAttribute($dob)
    {
        $this->attributes['dob'] = Carbon::parse($dob);
    }

    public function showPath()
    {
        return route('authors.show', $this->id);
    }
}
