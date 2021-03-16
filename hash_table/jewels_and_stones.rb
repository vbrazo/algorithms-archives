# You're given strings jewels representing the types of stones that are jewels,
# and stones representing the stones you have. Each character in stones is a type
# of stone you have. You want to know how many of the stones you have are also
# jewels.
#
# Letters are case sensitive, so "a" is considered a different type of stone from "A".
#
# Example 1:
#
# Input: jewels = "aA", stones = "aAAbbbb"
# Output: 3
#
# Example 2:
#
# Input: jewels = "z", stones = "ZZ"
# Output: 0
#
#
# Constraints:
#
# 1 <= jewels.length, stones.length <= 50
# jewels and stones consist of only English letters.
# All the characters of jewels are unique.

#
# Approach #1: Brute Force [Accepted]
#

# Complexity Analysis

# Time Complexity: O(J.length∗S.length)).
# Space Complexity: O(1) additional space complexity in
# Python. In Java, this can be O(J.length∗S.length)) because
# of the creation of new arrays.

# @param {String} jewels
# @param {String} stones
# @return {Integer}
def num_jewels_in_stones(jewels, stones)
  hash_table = {}
  count = 0

  jewels.chars.each do |jewel|
    stones.chars.each do |stone|
      if stone == jewel
        count += 1
      end
    end
  end

  count
end

jewels = "aA"
stones = "aAAbbbb"
puts(num_jewels_in_stones(jewels, stones))
# Output: 3

jewels = "z"
stones = "ZZ"
puts(num_jewels_in_stones(jewels, stones))
# Output: 0


#
# Approach 2: Hash map
#

# Complexity Analysis
#
# Time Complexity: O(J.length+S.length). The O(J.length) part
# comes from creating J. The O(S.length) part comes from
# searching S.
#
# Space Complexity: O(J.length).

# @param {String} jewels
# @param {String} stones
# @return {Integer}
def num_jewels_in_stones(jewels, stones)
  hash_table = {}
  count = 0

  stones.chars.each_with_index do |stone, i|
    if hash_table[stone].nil?
      hash_table[stone] = 1
    else
      hash_table[stone] += 1
    end
  end

  jewels.chars.each do |jewel|
    unless hash_table[jewel].nil?
      count += hash_table[jewel]
    end
  end

  count
end

jewels = "aA"
stones = "aAAbbbb"
puts(num_jewels_in_stones(jewels, stones))
# Output: 3

jewels = "z"
stones = "ZZ"
puts(num_jewels_in_stones(jewels, stones))
# Output: 0
