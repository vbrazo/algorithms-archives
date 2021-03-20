# Given an array of strings wordsDict and two different strings that already exist in the array word1 and word2, return the shortest distance between these two words in the list.
#
# Example 1:
#
# Input: wordsDict = ["practice", "makes", "perfect", "coding", "makes"], word1 = "coding", word2 = "practice"
# Output: 3
#
# Example 2:
#
# Input: wordsDict = ["practice", "makes", "perfect", "coding", "makes"], word1 = "makes", word2 = "coding"
# Output: 1
#
#
# Constraints:
#
# 1 <= wordsDict.length <= 3 * 104
# 1 <= wordsDict[i].length <= 10
# wordsDict[i] consists of lowercase English letters.
# word1 and word2 are in wordsDict.
# word1 != word2

#
# Approach: Divide and Conquer

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
