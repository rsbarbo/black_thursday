require 'bigdecimal'
require 'csv'
require 'time'

class Invoice
  attr_reader :id, :customer_id, :merchant_id,
  :status, :created_at, :updated_at

  def initialize(row)#, item_repo)
    @id = row[:id].to_i
    @customer_id = row[:customer_id].to_i
    @merchant_id = row[:merchant_id].to_i
    @status = row[:status]
    @created_at = Time.parse(row[:created_at].to_s)
    @updated_at = Time.parse(row[:updated_at].to_s)
  end

end
