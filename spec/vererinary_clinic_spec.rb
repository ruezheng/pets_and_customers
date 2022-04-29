require 'rspec'
require './lib/groomer'
require './lib/customer'
require './lib/pet'
require './lib/groomer'
require './lib/veterinary_clinic'

describe Veterinarian do
  it "exists" do
    tina = Veterinarian.new('Tina')

    expect(tina).to be_an_instance_of Veterinarian
  end

  it "has attributes" do
    tina = Veterinarian.new('Tina')

    expect(tina.name).to eq 'Tina'
    expect(tina.customers).to eq []
  end

  it "starts with no customers" do
    tina = Veterinarian.new('Tina')

    expect(tina.customers).to eq []
  end

  it "can add and return a list of customers per veterinarian" do
    tina = Veterinarian.new('Tina')
    rodger = Customer.new('Rodger', 22)
    angel = Customer.new('Angel', 41)

    tina.add_customer(rodger)
    tina.add_customer(angel)

    expect(tina.customers).to eq [rodger, angel]
  end

  it "can return a list of pets per customer" do
    tina = Veterinarian.new('Tina')
    rodger = Customer.new('Rodger', 22)
    samson = Pet.new({name: 'Samson', type: :dog, age: 3})
    lucy = Pet.new({name: 'Lucy', type: :cat, age: 12})

    rodger.adopt(samson)
    rodger.adopt(lucy)

    tina.add_customer(rodger)

    expect(tina.pets_per_customer(22)).to eq [samson, lucy]
  end

  it "can sort a list of all pets by age from oldest to youngest under a vets care" do
    tina = Veterinarian.new('Tina')
    rodger = Customer.new('Rodger', 22)
    angel = Customer.new('Angel', 41)
    samson = Pet.new({name: 'Samson', type: :dog, age: 3})
    lucy = Pet.new({name: 'Lucy', type: :cat, age: 12})
    tino = Pet.new({name: 'Tino', type: :dog, age: 8})

    rodger.adopt(samson)
    rodger.adopt(lucy)
    angel.adopt(tino)

    tina.add_customer(rodger)
    tina.add_customer(angel)

    expect(tina.all_pets_by_age).to eq [lucy, tino, samson]
  end

  xit "can count the number of pets of a given customer" do
    tina = Veterinarian.new('Tina')
    rodger = Customer.new('Rodger', 22)
    angel = Customer.new('Angel', 41)
    samson = Pet.new({name: 'Samson', type: :dog, age: 3})
    lucy = Pet.new({name: 'Lucy', type: :cat, age: 12})
    tino = Pet.new({name: 'Tino', type: :dog, age: 8})

    rodger.adopt(samson)
    rodger.adopt(lucy)
    angel.adopt(tino)

    tina.add_customer(rodger)
    tina.add_customer(angel)

    expect(tina.number_of_pets).to eq 3
  end
end
