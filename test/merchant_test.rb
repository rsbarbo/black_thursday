require_relative "../test_helper"
require_relative "../lib/merchant"
require_relative "../lib/item"

class MerchantTest < Minitest::Test
  attr_reader :m

  def setup
    @m = Merchant.new({:id => 5, :name => "Turing School"}, nil)
  end

  def test_returns_id
    assert_equal 5, m.id
  end

  def test_returns_name
    assert_equal "Turing School", m.name
  end

end
