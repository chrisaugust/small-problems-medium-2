# Tri-Angles
#
#
# Problem
#
# Write a method that takes the 3 angles of a triangle as arguments, 
# and returns a symbol :right, :acute, :obtuse, or :invalid depending 
# on whether the triangle is a right, acute, obtuse, or invalid triangle.
#
# You may assume integer valued angles so you don't have to worry about 
# floating point errors. You may also assume that the arguments are specified 
# in degrees.
#
# To be a valid triangle, the sum of the angles must be exactly 180 degrees, 
# and all angles must be greater than 0: if either of these conditions is 
# not satisfied, the triangle is invalid.
# 
# 
# Examples
#
# triangle(60, 70, 50) == :acute
# triangle(30, 90, 60) == :right
# triangle(120, 50, 10) == :obtuse
# triangle(0, 90, 90) == :invalid
# triangle(50, 50, 50) == :invalid
#
#
# Data Structures / Type Signature
# Int, Int, Int -> Sym
#
#
# Algorithm
# 1) check that triangle is valid
#       - all angles greater than 0
#       - angles sum to 180
# 2) check if triangle is a right angle triangle
# 3) check if there is an angle larger than 90 (obtuse)
# 4) check if all angles are less than 90 (acute)
#
#
# Code
require 'test/unit'

class TriAngles < Test::Unit::TestCase
  def test_triangle
    assert_equal(triangle(30, 90, 60), :right)
    assert_equal(triangle(120, 50, 10), :obtuse)
    assert_equal(triangle(0, 90, 90), :invalid)
    assert_equal(triangle(50, 50, 50), :invalid)
  end
end

def triangle(a1, a2, a3)
  if (a1 + a2 + a3 != 180)
    return :invalid
  elsif (a1 + a2 + a3 < 180)
    return :invalid
  elsif ([a1, a2, a3].min == 0)
    return :invalid
  elsif ([a1, a2, a3].max > 90)
    return :obtuse
  elsif ([a1, a2, a3].max < 90)
    return :acute
  elsif ([a1, a2, a3].max == 90)
    return :right
  end
end
