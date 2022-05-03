# Iteration 3

class Veterinarian
  attr_reader :name,
              :customers

  def initialize(name)
    @name = name
    @customers = []
  end

  def add_customer(customer)
    @customers << customer
  end

  def all_pets_by_age                        # A Veterinarian can list all pets under their care; sorted by age (oldest to youngest)
    pets = @customers.flat_map { |customer| customer.pets }
    pets.sort_by do |pet|
      pet.age
    end.reverse
  end

  def num_of_pets(customer)                 # A Veterinarian can count the number of pets of a given customer.
    @customers.map do |customer|
      customer.pets == customer
    end.count
  end
end
