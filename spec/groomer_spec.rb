∑require './lib/groomer'
require './lib/customer'
require './lib/pet'
require './lib/groomer'

describe Groomer do
  before :each do
    @groomer = Groomer.new('fluff_stop')
  end

  describe "Object" do
    it "exists" do
      expect(@groomer).to be_an_instance_of(Groomer)
    end

    it "has attributes" do
      expect(@groomer.name).to eq 'fluff_stop'
    end

    it "starts with no customers" do
      expect(@groomer.customers).to eq []
    end
  end

  describe "Integrating with Customers" do
    before :each do
      @judy = Customer.new("Judy", 2)
      @bobbi = Customer.new("Bobbi", 4)
      @samson = Pet.new({name: "Samson", type: :dog, age: 3})
      @pickle = Pet.new({name: "Pickle", type: :dog, age: 11})
      @kuma = Pet.new({name: "Kuma", type: :dog, age: 8})
    end

    it "can add customers" do
      @groomer.add_customer(@bobbi)
      @groomer.add_customer(@judy)

      expect(@groomer.customers).to eq [@bobbi, @judy]
    end

    it "can have multiple pets" do
      @judy.adopt(@pickle)
      @judy.adopt(@kuma)

      expect(@judy.pets).to eq [@pickle, @kuma]
    end

    it "can find all customers with outstanding balances" do
      @bobbi.charge(55)
      @judy.charge(29)
      @groomer.add_customer(@bobbi)
      @groomer.add_customer(@judy)

      expect(@groomer.customer_debt).to eq [@bobbi, @judy]
    end

    it "can count the number of pets per type" do
      @judy.adopt(@pickle)
      @judy.adopt(@kuma)
      @groomer.add_customer(@bobbi)
      @groomer.add_customer(@judy)

      expect(@groomer.number_of_pets(:dog)).to eq 2
    end
  end
end
