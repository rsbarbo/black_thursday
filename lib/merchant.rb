require 'csv'
require 'bigdecimal'

class Merchant

  attr_reader :id, :name, :engine

  def initialize(row, sales_engine)
    @id = row[:id].to_i
    @name = row[:name].downcase
    @engine = sales_engine
  end

end
