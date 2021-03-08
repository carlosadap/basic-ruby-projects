# 1
class MyClass; end

my_object = MyClass.new

# 2
module MyModule; end

class MyClass
  include MyModule
end

my_object = MyClass.new

# 3 && 4
# class MyCar
#   attr_accessor :color, :current_speed
#   attr_reader :year, :model

#   def self.gas_mileage(km, liters)
#     puts "#{km / liters} kilometers per liter of gas"
#   end

#   def initialize(year, color, model)
#     @year = year
#     @color = color
#     @model = model
#     @current_speed = 0
#   end

#   def speed_up(num)
#     self.current_speed += num
#   end

#   def brake(num)
#     self.current_speed -= num
#   end

#   def shut_off
#     self.current_speed = 0
#   end

#   def spray_paint(color)
#     self.color = color
#   end

#   def to_s
#     "This car is a #{color}, #{year}, #{model}"
#   end
# end

# 5
# change attr_reader to attr_accessor

class Animal
  def initialize
  end
end

class Bear < Animal
  def initialize(color)
    super
    @color = color
  end
end

# 6
module Towable
  def can_tow?
    @weight < 4000 ? true : false
  end
end

class Vehicle
  attr_accessor :color, :current_speed
  attr_reader :year, :model

  def self.gas_mileage(km, liters)
    puts "#{km / liters} kilometers per liter of gas"
  end
  
  def self.number_of_vehicules
    puts @@number_of_vehicules
  end

  @@number_of_vehicules = 0

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @current_speed = 0
    @@number_of_vehicules += 1
  end

  def speed_up(num)
    self.current_speed += num
  end

  def brake(num)
    self.current_speed -= num
  end

  def shut_off
    self.current_speed = 0
  end

  def spray_paint(color)
    self.color = color
  end

  def to_s
    "This car is a #{color}, #{year}, #{model}"
  end
end

class MyCar < Vehicle
  @@number_of_doors = 4
end

class MyTruck < Vehicle
  @@number_of_doors = 2
  include Towable
  
  def initialize(year, color, model, weight)
    super(year, color, model)
    @weight = weight
  end
end

