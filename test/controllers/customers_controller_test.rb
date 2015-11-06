require 'test_helper'

class CustomersControllerTest < ActionController::TestCase
  setup do
    @customer = customers(:one)
  end

  test "should list" do
    get :list
    assert_response :success
    assert_not_nil assigns(:customers)
  end

  test "should get customer" do
    get :get, id: @customer.id
    assert_response :success
  end

  test "should create customer" do
    assert_difference('Customer.count') do
      post :create, { email: @customer.email+'.test', name: @customer.name, password: @customer.password }
    end
    assert_response :success
  end

  test "should update customer" do
    put :update, {id: @customer.id, email: @customer.email+'.test2', name: @customer.name, password: @customer.password }
    assert_response :success
  end

  test "should destroy customer" do
    assert_difference('Customer.count', -1) do
      delete :destroy, id: @customer.id
    end
    assert_response :success
  end
end
