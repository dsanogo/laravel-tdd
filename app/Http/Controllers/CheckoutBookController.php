<?php

namespace App\Http\Controllers;

use App\Book;
use Illuminate\Http\Request;

class CheckoutBookController extends Controller
{
    public function __construct() {
        $this->middleware('auth');
    }

    public function checkout(Book $book)
    {
        $book->checkout(auth()->user());
    }

    public function checkin(Book $book)
    {
        $book->checkin(auth()->user());
    }
}
