# Sum Square - Square Sum 
#
# PROBLEM
# Write a method that computes the difference between the square of the sum
# of the first n positive integers and the sum of the squares of the first
# n positive integers.
#
# EXAMPLES
# sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
# sum_square_difference(10) == 2640
# sum_square_difference(1) == 0
# sum_square_difference(100) == 25164150
#
# TYPE SIGNATURE
# Integer -> Integer
#
# DATA STRUCTURE
#
# ALGORITHM 
# 0) convert argument into a range to iterate over for steps 1 and 2
# 1) compute square of sums
# 2) compute sum of squares
# 3) find and return difference between 1 and 2
#
# CODE
require 'test/unit'

class SumSquareDifference < Test::Unit::TestCase
  def test_sum_square_difference
    assert_equal sum_square_difference(3), 22
    assert_equal sum_square_difference(10), 2640
    assert_equal sum_square_difference(1), 0
    assert_equal sum_square_difference(100), 25164150
  end
end

def sum_square_difference(number)
  numbers = 1..number
  
  square_of_sums = (numbers.inject(&:+))**2
  sum_of_squares = numbers.map { |n| n**2 }.inject(:+)

  difference = square_of_sums - sum_of_squares  
end
