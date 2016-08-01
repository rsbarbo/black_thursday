require_relative "../test_helper"
require_relative "../lib/transaction"

class TransactionTest < Minitest::Test
    attr_reader :transaction

  def setup
    @transaction = Transaction.new({
    :id => 6,
    :invoice_id => 8,
    :credit_card_number => "4242424242424242",
    :credit_card_expiration_date => "0220",
    :result => "success",
    :created_at => Time.now,
    :updated_at => Time.now
    }, nil)
  end

    def test_it_returns_id
      assert_equal 6, transaction.id
    end

    def test_it_returns_invoice_id
      assert_equal 8, transaction.invoice_id
    end

    def test_it_returns_credit_card_number
      assert_equal 4242424242424242, transaction.credit_card_number
    end

    def test_it_returns_credit_card_expiration_date
      assert_equal "0220", transaction.credit_card_expiration_date
    end

    def test_it_returns_result
      assert_equal "success", transaction.result
    end

    def test_it_returns_created_at
      assert_equal Time.parse(Time.now.to_s), transaction.created_at
    end

    def test_it_returns_updated_at
      assert_equal Time.parse(Time.now.to_s), transaction.updated_at
    end



end
