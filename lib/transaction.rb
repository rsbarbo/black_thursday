class Transaction
  attr_reader :id,
              :invoice_id,
              :credit_card_number,
              :credit_card_expiration_date,
              :result,
              :created_at,
              :updated_at

  def initialize(row, transaction_repo)
    @id = row[:id].to_i
    @invoice_id = row[:invoice_id]
    @credit_card_number = row[:credit_card_number]
    @credit_card_expiration_date = row[:credit_card_expiration_date]
    @result = row[:result]
    @created_at = Time.parse(row[:created_at].to_s)
    @updated_at = Time.parse(row[:updated_at].to_s)
  end



end
