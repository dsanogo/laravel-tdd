<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Author extends Model
{
    protected $fillable = ['name', 'dob'];

    public function showPath()
    {
        return route('authors.show', $this->id);
    }
}
