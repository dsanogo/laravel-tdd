<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreAuthor extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'name' => 'required',
            'dob' => 'required|date_format:Y-m-d'
        ];
    }

    public function messages()
    {
        return [
            'name.required' => "Please enter the author name",
            'dob.required' => "Please enter the author DOB"
        ];
    }
}
