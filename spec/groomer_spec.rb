  require './lib/pet'
  require './lib/customer'
  require './lib/groomer'

  describe Groomer do
  let(:groomer) { Groomer.new("Bobbie") }
  let(:joel) { Customer.new("Joel", 2) }
  let(:andi) { Customer.new("Andi", 1) }
  let(:josie) { Customer.new("Josie", 3) }
  let(:samson) { Pet.new({name: "Samson", type: :dog, age: 3}) }
  let(:lucy) { Pet.new({name: "Lucy", type: :cat, age: 12}) }
  let(:pickle) { Pet.new({name: "Pickle", type: :dog, age: 11}) }

  it "exists and has attributes" do
    expect(groomer).to be_a(Groomer)
    expect(groomer.name).to eq("Bobbie")
    expect(groomer.customers).to eq []
  end

  it "can add multiple customers" do
    groomer.add_customer(joel)
    groomer.add_customer(andi)

    expect(groomer.customers).to eq [joel, andi]
  end

  it "can return a hash with customers as keys and an array of their pets as values" do
    joel.adopt(samson)
    joel.adopt(lucy)
    andi.adopt(pickle)
    groomer.add_customer(joel)
    groomer.add_customer(andi)

    expected = {
     joel => [samson, lucy],
     andi => [pickle]
    }
    expect(groomer.pets_by_customer).to eq expected
  end

  it "can calculate the outstanding_balance of customer" do
    joel.adopt(samson)
    joel.adopt(lucy)
    andi.adopt(pickle)
    groomer.add_customer(joel)
    groomer.add_customer(andi)
    groomer.add_customer(josie)

    joel.charge(15)
    joel.charge(7)
    andi.charge(10)

    expect(groomer.customer_debt).to eq [joel, andi]
  end

  it "can count the number of pets per type" do
    joel.adopt(samson)
    joel.adopt(lucy)
    andi.adopt(pickle)
    groomer.add_customer(joel)
    groomer.add_customer(andi)
    groomer.add_customer(josie)

    expect(groomer.num_of_pets(:dog)).to eq(2)
  end
end
