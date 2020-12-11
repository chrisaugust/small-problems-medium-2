# Triangle Sides
#
# Problem
# Write a method that takes the lengths of the three sides of a 
# triangle and returns a symbol :equilateral, :isosceles, :scalene,
# or :invalid.
#
#
#
#     equilateral: All 3 sides are of equal length
#     isosceles: 2 sides are of equal length, while the 3rd is different
#     scalene: All 3 sides are of different length
#     invalid: All sides have length greater than 0 and sum of two shortest
#              sides is greater than the length of the longest side
#
#
# Examples
# triangle(3, 3, 3) == :equilateral
# triangle(3, 3, 1.5) == :isosceles
# triangle(3, 4, 5) == :scalene
# triangle(0, 3, 3) == :invalid
# triangle(3, 1, 1) == :invalid
#
#
# Data Structures / Type Signature
# Int, Int, Int -> Sym 
#
# Algorithm
# 1) determine which sides are max, min, and mid
#    max = [s1, s2, s3].max
#    min = [s1, s2, s3].min
#    mid = [s1, s2, s3].select { |s| (s != max) && (s != min) }.pop
#
#
# - invalid
#   if [s1, s2, s3].select { |s| s == 0}.any?
#     return :invalid
#   elsif !([s1, s2, s3].max < ([s1, s2, s3].min + [s1, s2, s3].select { |s| s != s.min && s != s.max })
#     return :invalid
# - equilateral
#   elsif s1 == s2 && s2 == s3
#     return :equilateral
# - isosceles
#   elsif s1 < s2 && s2 == s3
#     return :isosceles
#   elsif s1 == s2 && s2 > s3
#     return :isosceles
#
# - scalene
#   else
#     return :scalene
#
# Code
require 'test/unit'

class TriangleSides < Test::Unit::TestCase
  def test_triangle
    assert_equal(triangle(3, 3, 3), :equilateral)
    assert_equal(triangle(3, 3, 1.5), :isosceles)
    assert_equal(triangle(3, 4, 5), :scalene)
    assert_equal(triangle(0, 3, 3), :invalid)
    assert_equal(triangle(3, 1, 1), :invalid)
  end
end

def triangle(s1, s2, s3)
  sides = [s1, s2, s3]
  max = [s1, s2, s3].max
  min = [s1, s2, s3].min                                        
  sides.delete_at(sides.index(sides.max))
  sides.delete_at(sides.index(sides.min))
  mid = sides.pop

  if ([s1, s2, s3].select { |s| s == 0 }.any?)
    return :invalid
  elsif (max > min + mid)
    return :invalid
  elsif ((s1 == s2) && (s2 == s3))
    return :equilateral
  elsif ((s1 < s2) && (s2 == s3))
    return :isosceles
  elsif ((s1 == s2) && (s2 > s3))
    return :isosceles
  else
    return :scalene
  end
end 
