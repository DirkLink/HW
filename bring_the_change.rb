# Normal Mode
# Write a Register class with a change function that takes an amount of money and returns the number of quarters, 
# dimes, nickels and pennies needed to produce that amount:

# r = Register.new r.change 0.99 # => [3, 2, 0, 4]

# Hard Mode
# Option 1 - OO

# Write a set of tests to verify that your register works (preferably before writing the register)
# Initialize the register with a fixed number of each coin. Note as the coins are distributed, 
# and e.g. use 2 nickels when you run out of dimes. What should happen when 
# you can't make change at all? Write specs for it and then implement it.
# Option 2 - Enumerable

# Allow for the addition / removal of coins e.g. we phase out the penny but add a 33¢ piece.
require 'minitest/autorun'
require 'pry'

class Register
  def initialize amount
    @amount = amount
    @change_array = [0,0,0,0]
  end

  def quarter
   @amount -= 0.25
   @change_array[0] += 1
  end

  def dime
    @amount -= 0.10
    @change_array[1] += 1
  end
    
  def knickel
    @amount -= 0.05
    @change_array[2] += 1
  end

  def penny
    @amount -= 0.01
    @change_array[3] += 1
  end
  def change
    until @amount <= 0.24 do
      self.quarter
    end
    until @amount <= 0.09 do
      self.dime
    end
    until @amount <= 0.04 do
      self.knickel
    end
    until @amount < 0.0001 do
      self.penny
    end
    return @change_array
  end

end

class RegisterTest < Minitest::Test
  def test_99
    r = Register.new(0.99)
    assert_equal r.change, [3,2,0,4]
  end

  def test_1
    r = Register.new(0.01)
    assert_equal r.change, [0,0,0,1]
  end
  def test_50
    r = Register.new(0.50)
    assert_equal r.change, [2,0,0,0]
  end
end