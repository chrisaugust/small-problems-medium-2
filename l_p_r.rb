# Lettercase Percentage Ratio
#
# Problem
# Write a method that takes a string and returns a hash containing 3 entries,
# one for the percentage of lowercase letters in the string, one for the 
# percentage of uppercase, and one for percentage of non-letter characters.
# Assume the argument string will always contain at least one character.
#
# Examples
#
# letter_percentages('abCdef 123') == 
#     { lowercase: 50, uppercase: 10, neither: 40 }
# letter_percentages('AbCd +Ef') == 
#     { lowercase: 37.5, uppercase: 37.5, neither: 25 }
# letter_percentages('123') == 
#     { lowercase: 0, uppercase: 0, neither: 100 }
#
#
# Data Structures / Type Signature
# Hash: { lowercase: Float, uppercase: Float, neither: Float }
#
# letter_percentages(String) -> Hash
#
#
# Algorithm
# 1) split string into characters
# 2) set total_chars to length of characters array; 
#    set uppercase to 0;  
#    set lowercase to 0; 
#    set non_letter_chars to 0
# 3) iterate over characters
#       4) check if uppercase, lowercase, or non letter character
#          and increment appropriate counter
# 5) calculate percentage ratios (eg (lowercase/total_chars)*100 ) 
# 6) return hash with percentage ratios from step 5
#
# Code
require 'test/unit'

class LetterPercentageRatio < Test::Unit::TestCase
  def test_letter_percentages
    assert_equal(letter_percentages('abCdef 123'), 
                     { lowercase: 50, uppercase: 10, neither: 40 })
    assert_equal(letter_percentages('AbCd +Ef'), 
                     { lowercase: 37.5, uppercase: 37.5, neither: 25 })
    assert_equal(letter_percentages('123'), 
                     { lowercase: 0, uppercase: 0, neither: 100 })
  end
end

def letter_percentages(string)
  characters = string.split('')
  total_characters = characters.length
  uppercase = 0
  lowercase = 0
  non_letter = 0
  
  characters.each do |c|
    if /[A-Z]/.match(c) 
      uppercase += 1
    elsif /[a-z]/.match(c)
      lowercase += 1
    else
      non_letter += 1
    end
  end
  
  return { lowercase: ((lowercase.to_f/total_characters.to_f)*100),
           uppercase: ((uppercase.to_f/total_characters.to_f)*100),
           neither: ((non_letter.to_f/total_characters.to_f)*100) 
          }
end
