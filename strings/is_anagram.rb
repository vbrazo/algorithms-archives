# Given two strings s and t , write a function to determine if t is an anagram of s.

# Note:
# You may assume the string contains only lowercase alphabets.
#
# Follow up:
# What if the inputs contain unicode characters? How would you adapt your solution to such case?


# Approach #2 (Hash Table)

# Algorithm
#
# To examine if tt is a rearrangement of ss, we can count
# occurrences of each letter in the two strings and compare
# them. Since both ss and tt contain only letters from a-z,
# a simple counter table of size 26 is suffice.
# Do we need two counter tables for comparison? Actually no,
# because we could increment the counter for each letter in s
# and decrement the counter for each letter in t, then check
# if the counter reaches back to zero.

# Complexity analysis
#
# Time complexity : O(n). Time complexity is O(n) because
# accessing the counter table is a constant time operation.
# Space complexity : O(1). Although we do use extra space,
# the space complexity is O(1) because the table's size stays
# constant no matter how large n is.

# @param {String} s
# @param {String} t
# @return {Boolean}
def is_anagram(s, t)
  return false if s.chars.count != t.chars.count

  hash1 = {}
  s.chars.each do |value|
    hash1[value] = if hash1[value]
                     hash1[value] + 1
                   else
                     1
                   end
  end

  hash2 = {}
  t.chars.each do |value|
    hash2[value] = if hash2[value]
                     hash2[value] + 1
                   else
                     1
                   end
  end

  hash1.each do |key, _value|
    return false if hash2[key] != hash1[key]
  end

  true
end

s = "anagram"
t = "nagaram"
puts(is_anagram(s, t))
# => true

s = "rat"
t = "car"
puts(is_anagram(s, t))
# => false

s = "a"
t = "ab"
puts(is_anagram(s, t))
# => false
