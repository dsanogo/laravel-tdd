<?php

namespace Tests\Feature;

use App\Book;
use App\Reservation;
use App\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class BookCheckoutTest extends TestCase
{
    use RefreshDatabase;

    /**
     * @test
     */
    public function a_book_can_be_checked_out_by_a_signed_in_user()
    {
        $this->withoutExceptionHandling();

        $book = $this->fakeBook();

        $response = $this->actingAs($user = $this->fakeUser())
                ->post(route('books.checkout', $book));

        $this->assertCount(1, Reservation::all());

        $reservation = Reservation::first();
        $this->assertEquals($user->id, $reservation->user_id);
        $this->assertEquals($book->id, $reservation->book_id);
        $this->assertEquals(now(), $reservation->checked_out_at);
        $response->assertOk();
    }

    private function fakeUser()
    {
        return factory(User::class)->create();
    }

    private function fakeBook()
    {
        return factory(Book::class)->create();
    }
}
