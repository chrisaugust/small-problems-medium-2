# Bubble Sort
#
#
# PROBLEM
# 
# Write a method that takes an Array and sorts that Array in place 
# using bubble sort. Assume the Array contains at least 2 elements.
#
#
# EXAMPLES
#
# array = [5, 3]
# bubble_sort!(array)
# array == [3, 5]
# 
# array = [6, 2, 7, 1, 4]
# bubble_sort!(array)
# array == [1, 2, 4, 6, 7]
# 
# array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
# bubble_sort!(array)
# array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
#
#
# DATA STRUCTURES / TYPE SIGNATURE
# 
# Array
#
# Array -> Array
#
#
# ALGORITHM
# 
# 1) loop through array (outer loop)
# 2) for each iteration of outer loop, 
#    loop through array elements, checking i against i + 1 
#    and swapping if i > i + 1
# 3) continue until all array elements have been compared with neighbors
#
# CODE
require 'test/unit'

class BubbleSort < Test::Unit::TestCase
  def test_bubble_sort!
    assert_equal(bubble_sort!([5, 3]), [3, 5])
    assert_equal(bubble_sort!([6, 2, 7, 1, 4]), [1, 2, 4, 6, 7])
    assert_equal(bubble_sort!(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)),
                             %w(Alice Bonnie Kim Pete Rachel Sue Tyler))
  end
end

def bubble_sort!(array)
  loop do
    swapped = false
    for i in (1..array.length-1)
      if array[i] < array[i-1]
        array[i], array[i-1] = array[i-1], array[i]
        swapped = true
      end
    end
    break if swapped == false
  end
  array
end
