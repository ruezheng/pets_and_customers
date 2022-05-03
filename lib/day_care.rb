class DayCare
  attr_reader :name,
              :customers

  def initialize(name)
    @name = name
    @customers = []
  end

  def add_customer(customer)
    @customers << customer
  end

  def customer_id(id)                       # A Day Care can find a customer by the customer's id
    @customers.find do |customer|
      customer.id == id
    end
  end

  def unfed_pets                            # * A Day Care can list all pets that are unfed
    pets = @customers.flat_map { |customer| customer.pets }
    pets.select { |pet| pet if !pet.fed? }
  end
end
