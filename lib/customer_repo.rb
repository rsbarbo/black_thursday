require_relative "../lib/customer"
require "csv"

class CustomerRepo
  attr_reader   :engine
  attr_accessor :all_customers

  def initialize(file_path, sales_engine)
    @all_customers = []
    @engine        = sales_engine
    @load_csvs     = load_csvs(file_path)
  end

  def load_csvs(file_path)
    content = CSV.open(file_path, headers: true, header_converters: :symbol)
    content.each do |row|
      all_customers << Customer.new(row, self)
    end
  end

  def all
    all_customers
  end

  def find_by_id(customer_id)
    all_customers.find do |customer|
      customer.id == customer_id
    end
  end

  def find_all_by_first_name(f_name)
    all_customers.find_all do |customer|
      customer.first_name.downcase.include?(f_name.downcase)
    end
  end

  def find_all_by_last_name(l_name)
    all_customers.find_all do |customer|
      customer.last_name.downcase.include?(l_name.downcase)
    end
  end


end
