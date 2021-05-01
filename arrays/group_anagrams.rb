# Given an array of strings strs, group the anagrams together. You can return the answer in any order.
#
# An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.
#
#
#
# Example 1:
#
# Input: strs = ["eat","tea","tan","ate","nat","bat"]
# Output: [["bat"],["nat","tan"],["ate","eat","tea"]]
#
# Example 2:
#
# Input: strs = [""]
# Output: [[""]]
#
# Example 3:
#
# Input: strs = ["a"]
# Output: [["a"]]
#
#
# Constraints:
#
# 1 <= strs.length <= 104
# 0 <= strs[i].length <= 100
# strs[i] consists of lower-case English letters.

# @param {String[]} strs
# @return {String[][]}
def group_anagrams(strs)
  ana_hash = Hash.new

  strs.each do |word|
    sort_key = word.chars.sort

    if ana_hash[sort_key]==nil
      ana_hash[sort_key]=[word]
    else
      ana_hash[sort_key]<<word
    end
  end

  ana_hash.values
end

strs = ["eat","tea","tan","ate","nat","bat"]
# Output: [["bat"],["nat","tan"],["ate","eat","tea"]]
print group_anagrams(strs)

strs = [""]
# Output: [[""]]
print group_anagrams(strs)

strs = ["a"]
print group_anagrams(strs)
# Output: [["a"]]
