# Unlucky Days 
#
#
# Problem
# Write a method that returns the number of Friday the 13ths in the
# year given by an argument. Assume the year is greater than 1752 (when
# the modern Gregorian Calendar was adopted by the UK). 
#
#
# Examples
# friday_13th(2015) == 3
# friday_13th(1986) == 1
# friday_13th(2019) == 2
#
#
# Type Signature
# Integer -> Integer
#
#
# Data Structures
# 1) range to represent months of the year
# 2) instance of Time class
#
#
# Algorithm
# 1) initiate a range (1..12) and iterate over it using #count
# 2) create an instance of Time using the year argument
#    and the month from the iteration
# 3) check if there is a Friday on the 13th of that year and month
# 4) return the number of Fridays landing on the 13th in that year
#
# Code
require 'test/unit'

class UnluckyDays < Test::Unit::TestCase
  def test_friday_13th
    assert_equal friday_13th(2015), 3
    assert_equal friday_13th(1986), 1
    assert_equal friday_13th(2019), 2
  end
end

def friday_13th(year)
  (1..12).count { |m| Time.new(year,m,13).friday? } 
end
