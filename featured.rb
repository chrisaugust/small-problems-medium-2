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
# 1) return error message for any argument integer greater than 10 digits long
# 2) loop
#     3) increment by 1
#     4) return if value is odd, divisible by 7, and has no duplicate digits
#     5) break when value exceeds 10 digits in length
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
