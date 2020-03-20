<?php

namespace Tests\Feature;

use App\Author;
use Carbon\Carbon;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class AuthorManagementTest extends TestCase
{
    use RefreshDatabase;

    /**
     * @test
     */
    public function an_author_can_be_created()
    {
        $response = $this->post(route('authors.store'), $this->fakeAuthor());
        $this->assertCount(1, Author::all());
        $author = Author::first();
        $this->assertInstanceOf(Carbon::class, $author->dob);
        $response->assertRedirect($author->showPath());
    }
    /**
     * @test
     */
    public function author_name_is_required()
    {
        $this->post(route('authors.store', array_merge($this->fakeAuthor(), ['name' => ''])))
                ->assertSessionHasErrors('name');
    }

    /**
     * @test
     */
    public function author_dob_is_should_be_format_yyy_mm_dd()
    {
        $this->post(route('authors.store', array_merge($this->fakeAuthor(), ['dob' => '1992-14-05'])))
                ->assertSessionHasErrors('dob');
    }

    /**
     * @test
     */
    public function author_dob_is_required()
    {
        $this->post($this->storeUrl(), array_merge($this->fakeAuthor(), ['dob' => '']))
                ->assertSessionHasErrors('dob');
    }

    protected function storeUrl()
    {
        return route('authors.store');
    }

    public function fakeAuthor()
    {
        return [
            'name' => 'Jordavid',
            'dob' => '05/14/1988'
        ];
    }
}
