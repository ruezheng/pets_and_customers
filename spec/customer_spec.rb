require './lib/customer'
require './lib/pet'

describe Customer do
  before :each do
    @joel = Customer.new("Joel", 2)
    @samson = Pet.new({name: "Samson", type: :dog, age: 3})
    @lucy = Pet.new({name: "Lucy", type: :cat, age: 12})
  end

  it "exists" do
    expect(@joel).to be_an_instance_of(Customer)
  end

  it "exists" do
    expect(@samson).to be_an_instance_of(Pet)
    expect(@lucy).to be_an_instance_of(Pet)
  end

  it "has attributes" do
    expect(@joel.name).to eq "Joel"
    expect(@joel.id).to eq 2adopt
  end

  it "starts with no pets" do
    expect(@joel.pets).to eq []
  end

  it "can adopt pets" do
    @joel.adopt(@samson)
    @joel.adopt(@lucy)

    expect(@joel.pets).to eq [@samson, @lucy]
  end

  it "has an outstanding balance" do
    expect(@joel.outstanding_balance).to eq 0

    @joel.charge(15)
    @joel.charge(7)

    expect(@joel.outstanding_balance).to eq 22
  end
end
