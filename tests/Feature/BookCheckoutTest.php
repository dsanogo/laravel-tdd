<?php

namespace Tests\Feature;

use App\Book;
use App\Reservation;
use App\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Illuminate\Support\Facades\Auth;
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

    /**
     * @test
     */
    public function only_signed_in_user_can_checkout_a_book()
    {
        $book = $this->fakeBook();

        $response = $this->post(route('books.checkout', $book));
        $this->assertCount(0, Reservation::all());

        $response->assertStatus(302);
        $response->assertRedirect('/login');
    }

    /**
     * @test
     */
    public function only_real_books_can_be_checked_out()
    {
        $this->actingAs($this->fakeUser());
        $this->post(route('books.checkout', 123))
                ->assertStatus(404);
        $this->assertCount(0, Reservation::all());
    }

    /**
     * @test
     */
    public function only_real_books_can_be_checked_in()
    {
        $book = $this->fakeBook();
        $this->actingAs($this->fakeUser())
                ->post(route('books.checkout', $book));
        $this->assertCount(1, Reservation::all());

        $this->post(route('books.checkin', '123'))->assertStatus(404);

        $this->assertNull(Reservation::first()->checked_in_at);
    }

    /**
     * @test
     */
    public function a_book_can_be_checked_in_by_a_signed_user()
    {
        $book = $this->fakeBook();
        $user = $this->fakeUser();
        $response = $this->actingAs($user)
            ->post(route('books.checkout', $book));

        $this->assertCount(1, Reservation::all());

        $response = $this->actingAs($user)
                ->post(route('books.checkin', $book));

        $this->assertEquals($user->id, Reservation::first()->user_id);
        $this->assertEquals($book->id, Reservation::first()->book_id);
        $this->assertNotNull(Reservation::first()->checked_in_at);
        $this->assertEquals(now(), Reservation::first()->checked_in_at);
    }

     /**
     * @test
     */
    public function only_signed_in_user_can_checkin_a_book()
    {
        $book = $this->fakeBook();

        $this->actingAs($this->fakeUser())
                    ->post(route('books.checkout', $book));

        Auth::logout();

        $this->post(route('books.checkin', $book))->assertRedirect('/login')
                        ->assertStatus(302);
        $this->assertCount(1, Reservation::all());
        $this->assertNull(Reservation::first()->checked_in_at);
    }

    /**
     * @test
     */
    public function only_checked_out_books_can_be_checked_in()
    {
        $book = $this->fakeBook();
        $user = $this->fakeUser();

        $this->actingAs($user)->post(route('books.checkin', $book))
                ->assertStatus(404);

        $this->assertCount(0, Reservation::all());
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
