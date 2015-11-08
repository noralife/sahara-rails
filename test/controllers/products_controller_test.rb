require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  setup do
    @admin   = customers(:admin)
    @product = products(:one)
  end

  test "should list" do
    get :list
    assert_response :success
    assert_not_nil assigns(:products)
  end

  test "should get product" do
    get :get, id: @product.id
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      request.headers["HTTP_SAHARA_TOKEN"] = @admin.token
      post :create, { desc: @product.desc, name: @product.name }
    end
    assert_response :success
  end

  test "should update product" do
    request.headers["HTTP_SAHARA_TOKEN"] = @admin.token
    put :update, { id: @product.id, desc: "new " + @product.desc, name: @product.name }
    assert_response :success
  end

  test "should destroy product" do
    request.headers["HTTP_SAHARA_TOKEN"] = @admin.token
    assert_difference('Product.count', -1) do
      delete :destroy, id: @product.id
    end
    assert_response :success
  end
end
