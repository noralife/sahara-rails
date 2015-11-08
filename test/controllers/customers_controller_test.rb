require 'test_helper'

class CustomersControllerTest < ActionController::TestCase
  setup do
    @admin = customers(:admin)
    @user  = customers(:user)
  end

  test "should list" do
    request.headers["HTTP_SAHARA_TOKEN"] = @admin.token
    get :list, nil
    assert_response :success
    assert_not_nil assigns(:customers)
  end

  test "should get customer" do
    request.headers["HTTP_SAHARA_TOKEN"] = @user.token
    get :get, {id: @user.id}
    assert_response :success
  end

  test "should create customer" do
    assert_difference('Customer.count') do
    request.headers["HTTP_SAHARA_TOKEN"] = @admin.token
      post(
        :create,
        { email: @user.email+'.test', name: @user.name, password: @user.password, role: "user"}
      )
    end
    assert_response :success
  end

  test "should update customer" do
    request.headers["HTTP_SAHARA_TOKEN"] = @user.token
    put(
      :update,
      {id: @user.id, email: @user.email+'.test2' }
    )
    assert_response :success
  end

  test "should destroy customer" do
    request.headers["HTTP_SAHARA_TOKEN"] = @user.token
    assert_difference('Customer.count', -1) do
      delete :destroy, {id: @user.id}
    end
    assert_response :success
  end
end
