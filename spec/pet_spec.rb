require 'rspec'
require './lib/pet'

describe Pet do
  before :each do
    @samson = Pet.new({name: "Samson", type: :dog, age: 3})
  end

  it "exists" do
    expect(@samson).to be_instance_of(Pet)
  end

  it "has attributes" do
    expect(@samson.name).to eq "Samson"
    expect(@samson.type).to eq :dog
    expect(@samson.age).to eq 3
  end

  it "has been fed?" do
    expect(@samson.fed?).to eq(false)
  end

  it "can be fed" do
    @samson.feed

    expect(@samson.fed?).to eq(true)
  end
end
