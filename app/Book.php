<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;

class Book extends Model
{
    protected $fillable = ['title', 'author', 'author_id'];

    public function setAuthorIdAttribute($authorId)
    {
        $this->attributes['author_id'] = (Author::firstOrCreate([
            'name' => $authorId
        ]))->id;
    }

    public function author()
    {
        return $this->belongsTo(Author::class);
    }

    public function reservations()
    {
        return $this->hasMany(Reservation::class);
    }

    public function checkout(User $user)
    {
        return $this->reservations()->create([
            'user_id' => $user->id,
            'checked_out_at' => now()
        ]);
    }

    public function checkin(User $user)
    {
        $reservation = $this->reservations()->where('user_id', $user->id)
                ->whereNotNull('checked_out_at')
                ->whereNull('checked_in_at')
                ->first();
                
        if($reservation){
            $reservation->update([
                'checked_in_at' => now()
            ]);
            return $reservation;
        }else {
            throw new NotFoundHttpException();
        }
        
    }
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
