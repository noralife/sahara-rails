require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  setup do
    @order = orders(:two)
    @user  = customers(:user)
  end

  test "should list" do
    request.headers["HTTP-SAHARA-TOKEN"] = @user.token
    get :list, nil
    assert_response :success
    assert_not_nil assigns(:orders)
  end

  test "should get order" do
    request.env['HTTP-SAHARA-TOKEN'] = @user.token
    get :get, {id: @order.id}
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count') do
    request.env['HTTP-SAHARA-TOKEN'] = @user.token
      post :create, { customer_id: @order.customer_id, product_id: @order.product_id, status: @order.status }
    end
    assert_response :success
  end

  test "should update order" do
    request.env['HTTP-SAHARA-TOKEN'] = @user.token
    put :update, {id: @order.id, product_id: @order.product_id, status: "new status"}
    assert_response :success
  end

  test "should destroy order" do
    request.env['HTTP-SAHARA-TOKEN'] = @user.token
    assert_difference('Order.count', -1) do
      delete :destroy, id: @order.id
    end
    assert_response :success
  end
end
