# Shortest Word Distance

# Given a list of words and two words word1 and word2,
# return the shortest distance between these two words in the list.

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
    if words[i] == word1
      words.each_with_index do |_, j|
        if words[j] == word2
          if min_distance < (i - j).abs
            min_distance = min_distance
          else
            min_distance = (i - j).abs
          end
        end
      end
    end
  end

  min_distance
end

words = ["practice", "makes", "perfect", "coding", "makes"]
word1 = "coding"
word2 = "practice"
puts(shortest_distance(words, word1, word2))
# Output: 3

words = ["practice", "makes", "perfect", "coding", "makes"]
word1 = "makes"
word2 = "coding"
puts(shortest_distance(words, word1, word2))
# Output: 1
