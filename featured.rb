# Next Featured Number Higher Than A Given Value
#
# PROBLEM
# A 'featured number' for this exercise is an odd number, a multiple of 7,
# whose digits occur once each. 
#
# Write a method that takes a single integer as an argument, and returns 
# the next featured number that is greater than the argument. Return an 
# error message if there is no next featured number.
#
# EXAMPLES
# 49 is a featured number, but 98 is not (it is not odd), 
# 97 is not (it is not a multiple of 7), and 133 is not 
# (the digit 3 appears twice).
#
# featured(12) == 21
# featured(20) == 21
# featured(21) == 35
# featured(997) == 1029
# featured(1029) == 1043
# featured(999_999) == 1_023_547
# featured(999_999_987) == 1_023_456_987
#
# featured(9_999_999_999) # => error: no possible number fits the requirements
#
# TYPE SIGNATURE
# Integer -> Integer
#
# DATA STRUCTURE
# Array to hold 'featured numbers'
#
# ALGORITHM 
# 0) initialize an empty array for the 'featured numbers'
# 1) generate a range based on the argument (1..((arg*1.25).round))
# 2) call #select on the range and supply a code block that will 
#    produce multiples of seven
# 3) same as above but select for odd numbers
# 4) same as above but select for numbers with no duplicate digits
# 5) save the results of step 5 to the array from step 0
# 6) find the element in the array which is the next 'featured number' 
#    greater than the argument
#
# CODE
require 'test/unit'

class FeaturedNumber < Test::Unit::TestCase
  def test_featured
    assert_equal featured(12), 21
    assert_equal featured(20), 21
    assert_equal featured(21), 35
    assert_equal featured(997), 1029
    assert_equal featured(1029), 1043
    assert_equal featured(999_999), 1_023_547
    assert_equal featured(999_999_987), 1_023_456_987
    assert_equal featured(9_999_999_999), 'error: no number fits the requirements' 
  end
end

def featured(num)
  if num < 100
    target = num * 2
  else
    target = (num*1.25).round
  end
  
  odds = ((num+1)..target).select { |n| n.odd? }
  odds_and_mult_7s = odds.select { |o| o % 7 == 0 }
  featured_numbers = odds_and_mult_7s.select { |p| no_dup_digits?(p) }

  if featured_numbers.first > 0 
    return featured_numbers.first
  else
    return "error: no number fits the requirements"
  end
end

def no_dup_digits?(num)
  digits = num.to_s.split('')

  if digits.uniq.length >= 10
    return false
  end

  digits_count = { '1' => 0,
                   '2' => 0,
                   '3' => 0,
                   '4' => 0,
                   '5' => 0,
                   '6' => 0,
                   '7' => 0,
                   '8' => 0,
                   '9' => 0,
                   '0' => 0 }
  
  digits.each do |d|
    if digits_count.has_key?(d)
      digits_count[d] += 1
    end
  end

  digits_count.each do |_,v|
    if v > 1
      return false
    end
  end
  return true
end
