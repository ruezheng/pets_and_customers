require './lib/pet'
require './lib/customer'
require './lib/veterinary_clinic'

describe Veterinarian do
  let(:veterinarian) { Veterinarian.new("Martha") }
  let(:joel) { Customer.new("Joel", 2) }
  let(:andi) { Customer.new("Andi", 1) }
  let(:josie) { Customer.new("Josie", 3) }
  let(:samson) { Pet.new({name: "Samson", type: :dog, age: 3}) }
  let(:lucy) { Pet.new({name: "Lucy", type: :cat, age: 12}) }
  let(:pickle) { Pet.new({name: "Pickle", type: :dog, age: 11}) }

  it "exists and has attributes" do
    expect(veterinarian).to be_a(Veterinarian)
    expect(veterinarian.name).to eq("Martha")
    expect(veterinarian.customers).to eq []
  end

  it "can add customers" do
    veterinarian.add_customer(joel)
    veterinarian.add_customer(andi)
    veterinarian.add_customer(josie)

    expect(veterinarian.customers).to eq [joel, andi, josie]
  end

  it "can list all pets under their care, sorted by age from oldest to youngest" do
    joel.adopt(samson)
    joel.adopt(lucy)
    andi.adopt(pickle)
    veterinarian.add_customer(joel)
    veterinarian.add_customer(andi)
    veterinarian.add_customer(josie)


    expect(veterinarian.all_pets_by_age).to eq [lucy, pickle, samson]
  end

  it "can count the number of pets of a given customer" do
    joel.adopt(samson)
    joel.adopt(lucy)
    andi.adopt(pickle)
    veterinarian.add_customer(joel)
    veterinarian.add_customer(andi)

    expect(veterinarian.num_of_pets(joel)).to eq(2)
  end
end
