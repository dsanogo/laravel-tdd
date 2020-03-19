<?php

namespace Tests\Unit;

use App\Author;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class AuthorTest extends TestCase
{
    use RefreshDatabase;

    /**
     * @test
     */
    public function dob_is_nullable()
    {
        Author::firstOrCreate([
            'name' => "tester"
        ]);

        $this->assertCount(1, Author::all());
    }
}
