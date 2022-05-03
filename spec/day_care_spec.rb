require './lib/pet'
require './lib/customer'
require './lib/day_care'

describe DayCare do
  let(:day_care) { DayCare.new("Fluff Stop") }
  let(:veterinarian) { Veterinarian.new("Martha") }
  let(:joel) { Customer.new("Joel", 2) }
  let(:andi) { Customer.new("Andi", 1) }
  let(:samson) { Pet.new({name: "Samson", type: :dog, age: 3}) }
  let(:lucy) { Pet.new({name: "Lucy", type: :cat, age: 12}) }
  let(:pickle) { Pet.new({name: "Pickle", type: :dog, age: 11}) }

  it "exists and has attributes" do
    expect(day_care).to be_a(DayCare)
    expect(day_care.name).to eq("Fluff Stop")
    expect(day_care.customers).to eq []
  end

  it "can add customers" do
    day_care.add_customer(joel)
    day_care.add_customer(andi)

    expect(day_care.customers).to eq [joel, andi]
  end

  it "can find a customer by customer id" do
    day_care.add_customer(joel)
    day_care.add_customer(andi)

    expect(day_care.customer_id(1)).to eq(andi)
  end

  it "can list all pets that are unfed" do
    day_care.add_customer(joel)
    day_care.add_customer(andi)
    joel.adopt(samson)
    joel.adopt(lucy)
    andi.adopt(pickle)
    samson.feed
    pickle.feed

    expect(day_care.unfed_pets).to eq [lucy]
  end
end
