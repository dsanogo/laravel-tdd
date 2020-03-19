<?php
namespace Tests\Unit;

use App\Book;
use App\Reservation;
use App\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class BookReservationTest extends TestCase
{   
    use RefreshDatabase;

    /**
     * @test
     */
    public function a_book_can_be_checked_out()
    {
        $this->withoutExceptionHandling();
        $book = $this->fakeBook();
        $user = $this->fakeUser();

        $book->checkout($user);

        $this->assertCount(1, Reservation::all());
        $this->assertEquals($user->id, Reservation::first()->user_id);
        $this->assertEquals($book->id, Reservation::first()->book_id);
        $this->assertEquals(now(), Reservation::first()->checked_out_at);
    }

    /**
     * @test
     */
    public function a_book_can_be_returned()
    {
        $book = $this->fakeBook();
        $user = $this->fakeUser();

        $book->checkout($user);

        $book->checkin($user);

        $this->assertCount(1, Reservation::all());
        $this->assertEquals($user->id, Reservation::first()->user_id);
        $this->assertEquals($book->id, Reservation::first()->book_id);
        $this->assertNotNull(Reservation::first()->checked_in_at);
        $this->assertEquals(now(), Reservation::first()->checked_in_at);
    }

    /**
     * @test
     */
    public function a_user_can_checkout_a_book_twice()
    {
        $book = $this->fakeBook();
        $user = $this->fakeUser();

        $book->checkout($user);

        $book->checkin($user);

        $book->checkout($user);

        $this->assertCount(2, Reservation::all());
        $this->assertEquals($user->id, Reservation::find(2)->user_id);
        $this->assertEquals($book->id, Reservation::find(2)->book_id);
        $this->assertNotNull(Reservation::find(2)->checked_out_at);
        $this->assertNull(Reservation::find(2)->checked_in_at);
        $this->assertEquals(now(), Reservation::find(2)->checked_out_at);

        $book->checkin($user);

        $this->assertCount(2, Reservation::all());
        $this->assertEquals($user->id, Reservation::find(2)->user_id);
        $this->assertEquals($book->id, Reservation::find(2)->book_id);
        $this->assertNotNull(Reservation::find(2)->checked_out_at);
        $this->assertNotNull(Reservation::find(2)->checked_in_at);
        $this->assertEquals(now(), Reservation::find(2)->checked_in_at);
    }

    /**
     * @test
     */
    public function only_checked_out_books_can_be_checked_in()
    {
        $this->expectException(\Exception::class);

        $book = $this->fakeBook();
        $user = $this->fakeUser();

        $book->checkin($user);
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
