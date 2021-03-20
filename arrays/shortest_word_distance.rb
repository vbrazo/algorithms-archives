# Shortest Word Distance

# Given a list of words and two words word1 and word2,
# return the shortest distance between these two words in the list.

# Solution:
# This is a straight-forward coding problem. The distance between any two
# positions `i1` and `i2` in an array is `|i1 - i2|`. To find the shortest
# distance between word1 and word2, we need to traverse the input array and
# find all occurrences i1 and i2 of the two words, and check if |i1 - i2| is
# less than the minimum distance computed so far.

#
# Approach #1 (Brute Force)
#

# Algorithm
#
# A naive solution to this problem is to go through the entire array looking for
# the first word. Every time we find an occurrence of the first word, we search
# the entire array for the closest occurrence of the second word.

# Complexity Analysis

# Time complexity: O(n^2), since for every occurrence of word1,
# we traverse the entire array in search for the closest occurrence of word2.
# Space complexity: O(1), since no additional space is used.

# @param {String[]} words
# @param {String} word1
# @param {String} word2
# @return {Integer}
def shortest_distance(words, word1, word2)
  min_distance = words.count
  i = 0

  words.each_with_index do |_, i|
    next unless words[i] == word1

    words.each_with_index do |_, j|
      next unless words[j] == word2

      diff = (i - j).abs

      min_distance = diff if min_distance > diff
    end
  end

  min_distance
end

words = %w[practice makes perfect coding makes]
word1 = 'coding'
word2 = 'practice'
puts(shortest_distance(words, word1, word2))
# Output: 3

words = %w[practice makes perfect coding makes]
word1 = 'makes'
word2 = 'coding'
puts(shortest_distance(words, word1, word2))
# Output: 1

#
# Approach #2 (One-pass)
#

# Algorithm
#
# We can greatly improve on the brute-force approach by keeping two indices
# i1 and i2 where we store the most recent locations of word1 and word2.
# Each time we find a new occurrence of one of the words, we do not need to
# search the entire array for the other word, since we already have the index
# of its most recent occurrence.

# Complexity Analysis
#
# Time complexity: O(N⋅M) where N is the number of words in the input list,
# and M is the total length of two input words.
#
# Space complexity: O(1), since no additional space is allocated.

def shortest_distance(words, word1, word2)
  min_distance = words.count

  i1 = -1
  i2 = -1

  words.each_with_index do |_word, i|
    if words[i] == word1
      i1 = i
    elsif words[i] == word2
      i2 = i
    end

    next unless i1 != -1 && i2 != -1

    diff = (i1 - i2).abs

    min_distance = diff if min_distance > diff
  end

  min_distance
end

words = %w[practice makes perfect coding makes]
word1 = 'coding'
word2 = 'practice'
puts(shortest_distance(words, word1, word2))
# Output: 3

words = %w[practice makes perfect coding makes]
word1 = 'makes'
word2 = 'coding'
puts(shortest_distance(words, word1, word2))
# Output: 1

#
# Approach 3: Divide and Conquer

# @param {String[]} words_dict
# @param {String} word1
# @param {String} word2
# @return {Integer}
def shortest_distance(words_dict, word1, word2)
  pos1 = []
  pos2 = []

  # find positions of word1 and word2 and
  # populate in arrays
  words_dict.each_with_index do |word, i|
    if word1 == word
      pos1.push(i)
    end

    if word2 == word
      pos2.push(i)
    end
  end

  # find minimum distance between
  # word1 and word2 based on the positions
  min = 0
  pos1.each do |k|
    pos2.each do |p|
      dist = (p - k).abs
      if min == 0
        min = dist
      elsif dist < min
        min = dist
      end
    end
  end

  min
end

words_dict = ["practice", "makes", "perfect", "coding", "makes"]
word1 = "coding"
word2 = "practice"
puts shortest_distance(words_dict, word1, word2)
# Output: 3

words_dict = ["practice", "makes", "perfect", "coding", "makes"]
word1 = "makes"
word2 = "coding"
puts shortest_distance(words_dict, word1, word2)
# Output: 1
