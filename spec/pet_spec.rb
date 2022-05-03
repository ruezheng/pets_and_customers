require './lib/pet'

describe Pet do
   let(:samson) { Pet.new({name: "Samson", type: :dog, age: 3}) }

   it "exists and has attributes" do
      expect(samson).to be_a(Pet)
      expect(samson.name).to eq("Samson")
      expect(samson.type).to eq(:dog)
      expect(samson.age).to eq(3)
      expect(samson.fed?).to eq(false)
   end

   it "can be fed" do
      samson.feed
      expect(samson.fed?).to eq(true)
   end
end

# DONE
