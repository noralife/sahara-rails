require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "should not save product without name" do
    product = Product.new
    assert_not product.save
  end
  test "should save customer with name" do
    product = Product.new(
      name: "apple"
    )
    assert product.save
  end
end
