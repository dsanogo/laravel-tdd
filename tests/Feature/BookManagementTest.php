<?php

namespace Tests\Feature;

use App\Author;
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
    public function book_author_id_is_required()
    {
        $this->post('books', array_merge($this->fakeBook(), ['author_id' => '']))
                ->assertSessionHasErrors('author_id');
    }

    /**
     * @test
     */
    public function book_title_and_author_id_are_required_to_store_book()
    {
        $this->post('books', array_merge($this->fakeBook(), ['title' => '', 'author_id' => '']))
                    ->assertSessionHasErrors('title', 'author_id');
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
    public function a_book_can_be_updated()
    {        
        $this->withoutExceptionHandling();
        $this->post('books', $this->fakeBook());
        
        $book = Book::first();
        $author = Author::first();
        $newTitle = "Cool updated Title";
        $newAuthor = "Davidson";
        $response = $this->patch($book->updatePath(), array_merge($this->fakeBook(), ['title' => $newTitle, 'author_id' => $newAuthor]));
        $this->assertEquals($newTitle, Book::first()->title);
        $this->assertEquals(2, Book::first()->author->id);
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

     /**
     * @test
     */
    public function a_new_author_is_added_auto_after_new_book_creattion()
    {
        $this->withoutExceptionHandling();
        $this->post($this->storeUrl(), $this->fakeBook());
        $this->assertCount(1, Book::all());
        $this->assertCount(1, Author::all());
        $book = Book::first();
        $author = Author::first();
        $this->assertEquals($author->id, $book->author_id);
    }


    private function storeUrl()
    {
        return route('books.store');
    }
    private function fakeBook()
    {
        return [
            'title' => 'Cool book title',
            'author_id' => 1
        ];
    }
}
