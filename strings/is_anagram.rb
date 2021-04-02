# Given two strings s and t , write a function to determine
# if t is an anagram of s.

# Note:
# You may assume the string contains only lowercase alphabets.
#
# Follow up:
# What if the inputs contain unicode characters?
# How would you adapt your solution to such case?

#
# Approach #1 (Sorting)
#

# Algorithm

# An anagram is produced by rearranging the letters of ss into t.
# Therefore, if t is an anagram of ss, sorting both strings will
# result in two identical strings. Furthermore, if s and t have
# different lengths, tt must not be an anagram of s and we can
# return early.

# Complexity analysis
#
# Time complexity: O(nlogn). Assume that nn is the length of s,
# sorting costs O(nlogn) and comparing two strings costs O(n).
# Sorting time dominates and the overall time complexity is O(nlogn).
#
# Space complexity: O(1). Space depends on the sorting
# implementation which, usually, costs O(1) auxiliary space
# if heapsort is used. Note that in Java, toCharArray()
# makes a copy of the string so it costs O(n) extra space,
# but we ignore this for complexity analysis because:
#
# It is a language dependent detail.
# It depends on how the function is designed. For example,
# the function parameter types can be changed to char[].

# @param {String} s
# @param {String} t
# @return {Boolean}
def is_anagram(s, t)
  s = s.chars.sort
  t = t.chars.sort

  return false if s.count != t.count

  s == t
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

#
# Approach #2 (Hash Table)
#

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
  s = s.chars
  t = t.chars

  return false if s.count != t.count

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

  hash1.keys.each do |key|
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

#
# Approach 3: Hash table
#

def is_anagram(s, t)
  s_length = s.length
  t_length = t.length
  counter = Hash.new(0)

  return false unless s_length == t_length

  (0...s_length).each do |i|
    counter[s[i]] += 1
  end

  (0...s_length).each do |i|
    counter[t[i]] -= 1

    return false if counter[t[i]] < 0
  end

  true
end

#
# Approach 4: Hash table
#

def is_anagram(s, t)
  s_length = s.length
  t_length = t.length
  counter = Hash.new(0)

  return false unless s_length == t_length

  (0...s_length).each do |i|
    counter[s[i]] += 1
    counter[t[i]] -= 1
  end

  counter.each do |_k, v|
    return false unless v == 0
  end

  true
end
