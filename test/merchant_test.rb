require_relative "../test_helper"
require_relative "../lib/merchant"
require_relative "../lib/item"
require 'time'

class MerchantTest < Minitest::Test
  attr_reader :m

  def setup
    @m = Merchant.new({:id => 5, :name => "Turing School", :created_at => "2016-08-02"}, nil)
  end

  def test_returns_id
    assert_equal 5, m.id
  end

  def test_returns_name
    assert_equal "Turing School", m.name
  end

  def test_returns_time
    assert_equal "2016-08-02 00:00:00 -0600", m.created_at.to_s
  end

end
