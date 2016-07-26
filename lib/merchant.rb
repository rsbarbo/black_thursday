require 'csv'
require 'bigdecimal'

class Merchant

  attr_reader :id, :name

  def initialize(row)
    @id = row[:id].to_i
    @name = row[:name].downcase
  end

end
