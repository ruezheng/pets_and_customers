require './lib/groomer'
require './lib/customer'
require './lib/pet'

RSpec.describe Groomer do
  before(:each) do
    @groomer = Groomer.new("The Hair Ball")
  end

  it "exists" do
    expect(@groomer).to be_instance_of(Groomer)
  end

  it "has a name" do
    expect(@groomer.name).to eq("The Hair Ball")
  end

  it "starts with no customers" do
    expect(@groomer.customers).to eq([])
  end

  it "can add customers" do
    joel = Customer.new("Joel", 2)
    billy = Customer.new("Billy", 3)
    @groomer.add_customer(joel)
    @groomer.add_customer(billy)

    expect(@groomer.customers).to eq([joel, billy])
  end

  it "can count the number of pets of a certain type" do
    joel = Customer.new("Joel", 2)
    samson = Pet.new({name: "Samson", type: :dog})
    lucy = Pet.new({name: "Lucy", type: :cat})
    joel.adopt(samson)
    joel.adopt(lucy)
    billy = Customer.new("Billy", 3)
    molly = Pet.new({name: "Molly", type: :cat})
    billy.adopt(molly)
    @groomer.add_customer(joel)
    @groomer.add_customer(billy)

    expect(@groomer.number_of_pets(:cat)).to eq(2)
  end

  it "can list customers with outstanding balances" do
    joel = Customer.new("Joel", 2)
    joel.charge(10)
    billy = Customer.new("Billy", 3)
    @groomer.add_customer(joel)
    @groomer.add_customer(billy)

    expect(@groomer.customers_with_oustanding_balances).to eq([joel])
  end

end
