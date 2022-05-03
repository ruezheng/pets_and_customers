# Iteration 3

class Groomer
  attr_reader :name,
              :customers

  def initialize(name)
    @name = name
    @customers = []
  end

  def add_customer(customer)				         # Each Groomer has multiple customers, and each of those customers can have multiple pets.
    @customers << customer
  end

  def pets_by_customer		                   # extra hash for fun, not required
    customer_pets_hash = {}
    @customers.each do |customer|
      customer_pets_hash[customer] = customer.pets
    end
    customer_pets_hash
  end

  def customer_debt                          # A Groomer can find all the customers with outstanding balances.
    @customers.select do |customer|
      customer.outstanding_balance != 0
    end
  end

  def num_of_pets(type)                     # A Groomer can count the number of pets of a given type. For example the groomer can count the number of cats, the number of dogs, etc. This should work for any pet type.
    pets = @customers.flat_map { |customer| customer.pets }
    pets.count do |pet|
      pet.type == type
    end
  end

  # OR
  # def num_of_pets(type)
  #   pets = @customers.flat_map { |customer| customer.pets }
  #   pets.select do |pet|
  #     pet.type == type
  #   end.count
  # end
end
