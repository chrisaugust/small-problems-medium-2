# Now I Know My ABCs 
#
# PROBLEM
# A collection of spelling blocks has two letters per block, 
# as shown in this list:
#
# B:O   X:K   D:Q   C:P   N:A
# G:T   R:E   F:S   J:W   H:U
# V:I   L:Y   Z:M
#
# This limits the words you can spell with the blocks to just those words 
# that do not use both letters from any given block. Each block can only be 
# used once.
#
# Write a method that returns true if the word passed in as an argument 
# can be spelled from this set of blocks, false otherwise.
#
# EXAMPLES
# block_word?('BATCH') == true
# block_word?('BUTCH') == false
# block_word?('jest') == true
#
# DATA STRUCTURES / TYPE SIGNATURE
# hash for block letters, eg { 'B' => 'O', 'X' => 'K', ...}
#
# String -> Boolean
#
# ALGORITHM
# 0) create a hash with the block letter pairings, 
#    with keys for all letters ie 'B' => 'O' and 'O' => 'B'
# 1) set a variable 'valid_block_word' equal to true
# 2) for each letter in the word argument, reference the hash and check 
#    if the corresponding block letter is elsewhere in the word
# 3) if the word has both block letters, set valid_block_word to false
# 4) return valid_block_word
#
#
# CODE
require 'test/unit'

class ABCs < Test::Unit::TestCase
  def test_block_word?
    assert_equal(block_word?('BATCH'), true)
    assert_equal(block_word?('BUTCH'), false)
    assert_equal(block_word?('jest'), true)
  end
end

def block_word?(word)
  block_letters = %w( B G V X R L D F Z C J N H O T I K E Y Q S M P W A U )
  pairs = %w( O T I K E Y Q S M P W A U B G V X R L D F Z C J N H )
  block_letters_hash = Hash[block_letters.zip(pairs)]

  valid_block_word = true

  letters = word.upcase.split('')
  letters.each do |l|
    if letters.include?(block_letters_hash[l])
      valid_block_word = false
    end
  end

  return valid_block_word 
end
