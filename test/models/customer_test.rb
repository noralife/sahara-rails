require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  test "should not save customer without name, email and password" do
    customer = Customer.new
    assert_not customer.save
  end
  test "should save customer with name, email and password" do
    customer = Customer.new(
      name: "test",
      email: "test@ho.hoge",
      password: "test",
      role: "user"
    )
    assert customer.save
  end
  test "should not save customer with the same email" do
    customer1 = Customer.new(
      name: "test",
      email: "test@ho.hoge",
      password: "test",
      role: "user"
    )
    customer1.save
    customer2 = Customer.new(
      name: "test",
      email: "test@ho.hoge",
      password: "test",
      role: "user"
    )
    assert_not customer2.save
  end
end
