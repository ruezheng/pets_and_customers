require './lib/pet'
require './lib/customer'

describe Customer do
   let(:joel) { Customer.new("Joel", 2) }
   let(:samson) { Pet.new({name: "Samson", type: :dog, age: 3}) }
   let(:lucy) { Pet.new({name: "Lucy", type: :cat, age: 12}) }

   it "exists and has attributes" do
      expect(joel).to be_a(Customer)
      expect(joel.name).to eq("Joel")
      expect(joel.id).to eq(2)
      expect(joel.pets).to eq []
      expect(joel.outstanding_balance).to eq(0)
   end

   it "can adopt pets" do
      joel.adopt(samson)
      joel.adopt(lucy)
      expect(joel.pets).to eq [samson, lucy]
   end

   it "can charge to outstanding_balance" do
      joel.charge(15)
      joel.charge(7)
      expect(joel.outstanding_balance).to eq(22)
   end
end

# DONE
