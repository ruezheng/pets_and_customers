# * A Veterinarian can list all pets under their care; sorted by age (oldest to youngest)

# * A Veterinarian can count the number of pets of a given customer.
#
# Build upon your code from the first two iterations to complete this task.


class Veterinarian
  attr_reader :name, :customers

  def initialize(name)
    @name = name
    @customers = []
  end

  def add_customer(customer)
    @customers << customer
  end

  # def pets_per_customer(id)
  #   pets = []
  #   @customers.find do |customer|
  #     pets = customer.pets if customer.id == id
  #   end
  #   pets
  # end

  def pets_per_customer(id)
    @customers.find do |customer|
      customer.id == id
    end.pets
  end

  def all_pets_by_age
    all_pets = @customers.flat_map do |customer|
      customer.pets
    end
    all_pets.sort_by do |pet|
      pet.age
    end.reverse
  end

  def number_of_pets(id)
    @customers.find do |customer|
      customer.pets
    end.count
  end


end
