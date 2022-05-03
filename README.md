# Practice Paired Assessment

This is an example of a Paired Assessment for Turing's Back End Module 1 students to reference and practice.

## Assessment Format

Before the assessment, students will be given the [Prework](./prework.md) to complete before arriving at the assessment. During the assessment, students will be given an additional coding challenge that builds upon their existing code. Students will be expected to complete iteration 3. This repository includes three examples: [Groomer](./groomer.md), [Day Care](./day_care.md) and [Veterinary Clinic](./veterinary_clinic.md).

The code provided in the `lib` and `spec` directory is an example of the code a student would build for a passing paired assessment for *Groomer* and *Day Care*.

---

# Pets and Customers Prework

## Iteration 1

Use TDD to create a `Pet` class that responds to the following interaction pattern:

```ruby
pry(main)> require './lib/pet'
# => true

pry(main)> samson = Pet.new({name: "Samson", type: :dog, age: 3})    
# => #<Pet:0x00007fb68d9f99f8...>

pry(main)> samson.name
# => "Samson"

pry(main)> samson.type
# => :dog

pry(main)> samson.age
# => 3

pry(main)> samson.fed?
# => false

pry(main)> samson.feed

pry(main)> samson.fed?
# => true
```

## Iteration 2

Use TDD to create a `Customer` class that responds to the following interaction pattern:

```ruby
pry(main)> require './lib/customer'
# => true

pry(main)> require './lib/pet'
# => true

pry(main)> joel = Customer.new("Joel", 2)    
# => #<Customer:0x00007ff8dd986e70...>

pry(main)> joel.name
# => "Joel"

pry(main)> joel.id
# => 2

pry(main)> joel.pets
# => []

pry(main)> samson = Pet.new({name: "Samson", type: :dog, age: 3})
# => #<Pet:0x00007ff8dc1f86a0...>

pry(main)> lucy = Pet.new({name: "Lucy", type: :cat, age: 12})    
# => #<Pet:0x00007ff8dc93e108...>

pry(main)> joel.adopt(samson)

pry(main)> joel.adopt(lucy)    

pry(main)> joel.pets
# => [#<Pet:0x00007ff8dc1f86a0...>, #<Pet:0x00007ff8dc93e108...>]

pry(main)> joel.outstanding_balance
# => 0x

pry(main)> joel.charge(15)

pry(main)> joel.charge(7)    

pry(main)> joel.outstanding_balance
# => 22
```
