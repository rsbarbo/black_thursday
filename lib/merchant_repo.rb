require "csv"
require "./lib/merchant"

class MerchantRepo
  attr_accessor :all_merchants

  def initialize(file_path)
    @all_merchants = []
    @load_csvs = load_csvs(file_path)
  end

    def load_csvs(file_path)
      content = CSV.open(file_path, headers: true, header_converters: :symbol)
      content.each do |row|
        all_merchants << Merchant.new(row)
      end
    end

    def all
      all_merchants
    end

    def find_by_id(id_number)
      all_merchants.find do |merchant|
        merchant.id == id_number
      end
    end

    def find_by_name(name)
      all_merchants.find do |merchant|
        merchant.name == name.downcase
      end
    end

end
