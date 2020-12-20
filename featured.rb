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
    #assert_equal featured(999_999_987), 1_023_456_987
    assert_equal featured(9_999_999_999), 'error: no number fits the requirements' 
  end
end

def featured(n)
  if n >= 9_999_999_999 
    return "error: no number fits the requirements"
  end

  while n.to_s.chars.size < 11
    n += 1
    return n if (no_dup_digits?(n) && n.odd? && n % 7 == 0)
  end
end

def no_dup_digits?(n)
  digits = n.to_s.chars
  digits.uniq.size == digits.size
end
