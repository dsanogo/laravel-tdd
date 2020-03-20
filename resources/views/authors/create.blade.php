@extends('layouts.app')

@section('content')
<div class="bg-gray-200 mx-auto w-2/3 p-6 shadow">

    <form action="{{ route('authors.store') }}" method="POST" class="flex flex-col text-center">
        <h2>Create an author</h2>
        @include('authors._form')
    </form>
</div>
@endsection
