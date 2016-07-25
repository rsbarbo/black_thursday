require 'pry'
require 'CSV'


class Item
  def data_load
    contents = CSV.open "./test/support/items_test.csv", headers: true, header_converters: :symbol
    contents.map do |row|
      id = row[0]
    end
    require 'pry'; binding.pry


  end
end
