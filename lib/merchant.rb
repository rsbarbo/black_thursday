require 'csv'
require 'bigdecimal'

class Merchant
  attr_reader :id, :name, :merchant_repo

  def initialize(row, merchant_repo)
    @id = row[:id].to_i
    @name = row[:name]
    @merchant_repo = merchant_repo
  end

  def items
    merchant_repo.find_merchant_by_item_id(self.id)
  end
end
