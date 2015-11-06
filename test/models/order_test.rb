require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  test "should not save order without customer_id and product_id" do
    order = Order.new
    assert_not order.save
  end
  test "should not save order with wrong customer_id and wrong product_id" do
    order = Order.new(
      customer_id: "hoge",
      product_id: "hoge"
    )
    assert_not order.save
  end
end
