class Pet
  attr_reader :name,
              :type,
              :age

  def initialize(attributes)
    @name = attributes[:name]
    @type = attributes[:type]
    @age = attributes[:age]
    @feeding_status = false
  end

  def fed?
    @feeding_status
  end

  def feed
    @feeding_status = true
  end
end
