class Customer
  attr_reader :id,
              :first_name,
              :last_name,
              :created_at;
              :updated_at

  def initialize(row, customer_repo)
    @id = row[:id].to_i
    @first_name = row[:first_name]
    @last_name = row[:last_name]
    @created_at = Time.parse(row[:created_at].to_s)
    @updated_at = Time.parse(row[:updated_at].to_s)
  end


end
