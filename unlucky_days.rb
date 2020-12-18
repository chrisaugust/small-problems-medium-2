# Unlucky Days 
#
# Problem
# Write a method that returns the number of Friday the 13ths in the
# year given by an argument. Assume the year is greater than 1752 (when
# the modern Gregorian Calendar was adopted by the UK). 
#
# Examples
# friday_13th(2015) == 3
# friday_13th(1986) == 1
# friday_13th(2019) == 2
#
# Data Structures / Type Signature
#
# Algorithm
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
  (1..12).count { |m| Time.gm(year,m,13).friday? } 
end
