<?php

namespace App\Http\Controllers;

use App\Book;
use Illuminate\Http\Request;

class CheckoutBookController extends Controller
{
    public function checkout(Book $book)
    {
        $book->checkout(auth()->user());
    }
}
