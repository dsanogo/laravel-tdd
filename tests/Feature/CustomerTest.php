<?php

namespace Tests\Feature;

use App\Models\Customer;
use App\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class CustomerTest extends TestCase
{
    use RefreshDatabase;
   /**
    * Only  Logged In users can see the customers list
    *@test
    * @return void
    */
    public function only_logged_in_users_can_view_customers_list()
    {
        // $this->withoutExceptionHandling();
        $response = $this->get('customers')->assertRedirect('login');
    }
    
    /**
     * auth users can view customers list
     *
     * @test
     * @return void
     */
    public function authenticated_user_can_view_customer_list()
    {
        // $this->withoutExceptionHandling();
        $this->actingAsNormalUser();
        $response = $this->get('customers')->assertOk();
    }

    /**
     * Auth users should be able to create customers
     *@test
     * @return void
     */
    public function authenticated_user_can_create_customer()
    {
        // $this->withoutExceptionHandling();

        $this->actingAsNormalUser();
        $customer = $this->fakeCustomer();
        $this->post('customers', $customer)->assertStatus(403);
    }

    /**
     * @test
     * Testing Only admin can create customer
     */

    public function non_admin_users_should_not_be_able_to_create_a_customer()
    {
        $this->actingAsNormalUser();
        $this->post('customers', $this->fakeCustomer())->assertStatus(403);
    }

    /**
     * @test
     * Testing Only admin can create customer
     */

    public function only_admin_should_be_able_to_create_a_customer()
    {
        $this->actingAsAdmin();
        $this->post('customers', $this->fakeCustomer())->assertStatus(201);
    }

    /**
     * name and Email are required to create a customer
     *
     * @test
     * @return void
     */
    public function name_and_email_are_required_to_create_customer()
    {
        
        $this->actingAsAdmin();
        $response = $this->post('customers', array_merge($this->fakeCustomer(), ['name' => '', 'email' => '']));
        $response->assertSessionHasErrors(['name', 'email']);

        $this->assertCount(0, Customer::all());
    }

    private function actingAsNormalUser()
    {
        $this->actingAs($this->fakeUser());
    }

    private function actingAsAdmin()
    {
        return $this->actingAs($this->adminUser());
    }

    private function adminUser()
    {
        return User::create([
            'name' => "Admin",
            'email' => 'admin@admin.com',
            'password' => bcrypt('123456')
        ]);
    }

    private function fakeUser()
    {
        return factory(User::class)->create();
    }

    public function fakeCustomer()
    {
        return [
            'name' => 'my name',
            'email' => 'myemail@email.com'
        ];
    }
}
