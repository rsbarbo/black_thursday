require "./test_helper"
require_relative "../lib/customer"
require_relative "../test/test_supporter"

class CustomerTest < Minitest::Test
  attr_reader :customer

  def setup
    @customer = Customer.new({
  :id => 6,
  :first_name => "Joan",
  :last_name => "Clarke",
  :created_at => Time.now,
  :updated_at => Time.now
  }, nil)
  end

  def test_it_returns_id
    assert_equal 6, customer.id
  end

  def test_it_returns_first_name
    assert_equal "Joan", customer.first_name
  end

  def test_it_returns_last_name
    assert_equal "Clarke", customer.last_name
  end

  def test_it_returns_created_at
    assert_equal Time.parse(Time.now.to_s), customer.created_at
  end

  def test_it_returns_updated_at
    assert_equal Time.parse(Time.now.to_s), customer.updated_at
  end

end
