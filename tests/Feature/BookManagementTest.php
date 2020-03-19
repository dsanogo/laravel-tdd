<?php

namespace Tests\Feature;

use App\Book;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class BookManagementTest extends TestCase
{
    use RefreshDatabase;

   /**
    * @test
    */
    public function a_book_can_be_added_to_the_library()
    {
        $response = $this->post('books', $this->fakeBook());
        $this->assertCount(1, Book::all());
        $book = Book::first();
        $response->assertRedirect($book->showPath());
    }

    /**
     * @test
     */
    public function book_title_is_required()
    {
        $this->post('books', array_merge($this->fakeBook(), ['title' => '']))
                ->assertSessionHasErrors('title');
    }

    /**
     * @test
     */
    public function book_author_is_required()
    {
        $this->post('books', array_merge($this->fakeBook(), ['author' => '']))
                ->assertSessionHasErrors('author');
    }

    /**
     * @test
     */
    public function book_title_and_author_are_required_to_store_book()
    {
        $this->post('books', array_merge($this->fakeBook(), ['title' => '', 'author' => '']))
                    ->assertSessionHasErrors('title', 'author');
    }

    /**
     * @test
     */
    public function book_title_should_be_at_least_3_chars()
    {
        $this->post('books', array_merge($this->fakeBook(), ['title' => 'ab']))
                        ->assertSessionHasErrors('title');
    }

     /**
     * @test
     */
    public function book_author_should_be_at_least_5_chars()
    {
        $this->post('books', array_merge($this->fakeBook(), ['author' => 'abcd']))
                ->assertSessionHasErrors('author');
    }

    /**
     * @test
     */
    public function a_book_can_be_updated()
    {        
        $this->post('books', $this->fakeBook());
        
        $book = Book::first();
        
        $newTitle = "Cool updated Title";
        $newAuthor = "Davidson";

        $response = $this->patch($book->updatePath(), array_merge($this->fakeBook(), ['title' => $newTitle, 'author' => $newAuthor]));
        $this->assertEquals($newTitle, Book::first()->title);
        $this->assertEquals($newAuthor, Book::first()->author);
        $response->assertRedirect($book->fresh()->showPath());
    }

    /**
     * @test
     */
    public function a_book_can_be_deleted()
    {
        $this->post('books', $this->fakeBook());

        $this->assertCount(1, Book::all());
        $book = Book::first();

        $response = $this->delete($book->deletePath());
        $this->assertCount(0, Book::all());

        $response->assertRedirect(route('books.index'));
    }

    private function fakeBook()
    {
        return [
            'title' => 'Cool book title',
            'author' => 'David'
        ];
    }
}
