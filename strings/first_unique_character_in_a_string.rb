# Given a string, find the first non-repeating character in it
# and return its index. If it doesn't exist, return -1.

#
# Approach 1: Linear time solution (Hash map approach)
#

# The best possible solution here could be of a linear time
# because to ensure that the character is unique you have to
# check the whole string anyway.
# The idea is to go through the string and save in a hash map
# the number of times each character appears in the string.
# That would take O(N) time, where N is a number of characters
# in the string.
# 
# And then we go through the string the second time,
# this time we use the hash map as a reference to check
# if a character is unique or not. If the character is unique,
# one could just return its index. The complexity of the second
# iteration is O(N) as well.

# Complexity Analysis

# Time complexity: O(N) since we go through
# the string of length N two times.
# Space complexity: O(1) because English alphabet
# contains 26 letters.

# @param {String} s
# @return {Integer}
def first_uniq_char(s)
  hash_table = {}

  s.chars.each_with_index do |value, _index|
    hash_table[value] = if hash_table[value]
                          hash_table[value] + 1
                        else
                          1
                        end
  end

  non_repetead = ''
  pointer = 0

  hash_table.each do |_key, value|
    return pointer if value == 1

    pointer += 1
  end
end

s = 'leetcode'
puts(first_uniq_char(s))
# => 0

s = 'loveleetcode'
puts(first_uniq_char(s))
# => 2

#
# Approach 2: Linear time solution (Solve with an array)
#

def first_uniq_char(s)
  used_chars = []

  s.chars.each_with_index do |c, i|
    next if used_chars.include?(c)
    return i if s.chars.count(c) == 1

    used_chars << c
  end

  -1
end

s = 'leetcode'
puts(first_uniq_char(s))
# => 0

s = 'loveleetcode'
puts(first_uniq_char(s))
# => 2
