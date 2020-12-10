# Matching Parentheses? 
#
#
# Problem
# Write a method that takes a string as argument and returns true if
# all parentheses in the string are properly balanced, false otherwise.
#
#
# Examples
# balanced?('What (is) this?') == true
# balanced?('What is) this?') == false
# balanced?('What (is this?') == false
# balanced?('((What) (is this))?') == true
# balanced?('((What)) (is this))?') == false
# balanced?('Hey!') == true
# balanced?(')Hey!(') == false
# balanced?('What ((is))) up(') == false
#
#
# Data Structures / Type Signature
# Array for holding string characters to iterate over
# 
# balanced?(String) -> Boolean
#
# Algorithm
# 1) split string into characters
# 2) record indices of '(' and ')' characters
# 3) return false if number of open and close parents don't match
# 4) if tallies match, check that the indices of 
#    opening parens '(' is less than the indices of 
#    closing parens ')'
#
# Code
require 'test/unit'

class MatchingParentheses < Test::Unit::TestCase
  def test_balanced?
    assert_equal(balanced?('What (is) this?'), true)
    assert_equal(balanced?('What is) this?'), false)
    assert_equal(balanced?('What (is this?'), false)
    assert_equal(balanced?('((What) (is this))?'), true)
    assert_equal(balanced?('((What)) (is this))?'), false)
    assert_equal(balanced?('Hey!'), true)
    assert_equal(balanced?(')Hey!('), false)
    assert_equal(balanced?('What ((is))) up('), false)
  end
end

def balanced?(string)
  opening_parens = []
  closing_parens = []
  
  characters = string.split('')
  characters.each_with_index do |c, idx|
    if c == '('
      opening_parens << idx
    elsif c == ')'
      closing_parens << idx 
    end
  end
  
  
  if opening_parens.length != closing_parens.length
    return false
  end


  p opening_parens
  p closing_parens
  
  opening_parens.each_with_index do |op, op_idx|
    (op_idx..((closing_parens.length)-1)).each do |cp_idx|
      if op > closing_parens[cp_idx]
        return false
      end
    end
  end
    
  return true
end
