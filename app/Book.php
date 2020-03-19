<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Book extends Model
{
    protected $fillable = ['title', 'author'];

    public function showPath()
    {
        return route('books.show', $this->id);
    }

    public function editPath()
    {
        return route('books.edit', $this->id);
    }

    public function updatePath()
    {
        return route('books.update', $this->id);
    }
    
    public function deletePath()
    {
        return route('books.destroy', $this->id);
    }

}
