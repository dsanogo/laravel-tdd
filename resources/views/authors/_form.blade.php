@csrf
<div class="pt-4">
    <input type="text" name="name" id=""
            placeholder="Full Name"
            class="rounded px-4 py-2 w-1/2"
            autocomplete="off"
            value="{{ old('name') }}"
            >
    @error('name')
        <p class="text-red-600">{{ $message }}</p>
    @enderror
</div>
<div class="pt-4">
    <input type="text" name="dob" id=""
        placeholder="Date of Birth"
        class="rounded px-4 py-2 w-1/2"
        autocomplete="off"
        value="{{ old('dob') }}"
        >
    @error('dob')
        <p class="text-red-600">{{ $message }}</p>
    @enderror
</div>
<div class="pt-4">
    <button class="bg-blue-400 text-white rounded py-2 px-4">Add Author</button>
</div>
