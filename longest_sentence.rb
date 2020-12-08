# Longest Sentence
#
# PROBLEM
# Write a program that reads the content of a text file and 
# prints the longest sentence (based on number of words) contained
# in the file. The number of words in this sentence should also
# be printed. Sentences may end with periods, exclamation points,
# or question marks. Any sequence of characters that aren't spaces or
# sentence ending punctuation characters should be treated as 
# a word. 
#
# EXAMPLES
# longest_sentence(Gettysburg.txt) ->
#   It is rather for
#   us to be here dedicated to the great task remaining
#   before us -- that from these honored dead we take
#   increased devotion to that cause for which they gave
#   the last full measure of devotion -- that we here highly
#   resolve that these dead shall not have died in vain
#   -- that this nation, under God, shall have a new birth
#   of freedom -- and that government of the people, by
#   the people, for the people, shall not perish from the
#   earth.
#   
#   87 words ('--'counts as a word) 
#
# longest_sentence(Frankenstein.txt) -> 
#   ???
#   157 words
#
#
# DATA STRUCTURES/ TYPE SIGNATURE
#
# OpenStruct for result
# longest_s = OpenStruct.new
# longest_s.content = String
# longest_s.word_count = Integer
#
# longest_sentence(File) -> OpenStruct
#
#
# ALGORITHM
# 1) open target file and read into a variable called text
# 2) split text into sentences
# 3) initiate a variable called 'longest_idx' to keep track of the index
#    of longest sentence
# 3) iterate over sentences, computing word count for each, and storing 
#    word count as well as updating 'longest' variable with the index of
#    the sentence with the longest word count
# 4) return longest sentence as an OpenStruct 
#    
#
#
# CODE
require 'test/unit'
require 'ostruct'

class LongestSentence < Test::Unit::TestCase
  def test_longest_sentence
    assert_equal(longest_sentence("test.txt").word_count, 5)
    assert_equal(longest_sentence("Gettysburg.txt").word_count, 86)
    assert_equal(longest_sentence("Frankenstein.txt").word_count, 157)
  end
end

def longest_sentence(text)
  file = File.open(text)
  text = file.read
  file.close

  longest_idx = 0
  word_count = 0 

  sentences = text.split(/\.|\?|!/)
  sentences.each_with_index do |s, i|
    words = s.split(' ')
    if words.length > word_count
      longest_idx = i
      word_count = words.length
    end
  end

  longest_sentence = OpenStruct.new
  longest_sentence.content = sentences[longest_idx]
  longest_sentence.word_count = word_count
  
  return longest_sentence
end
