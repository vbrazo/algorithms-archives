# Given two strings a and b, return true if you can swap two letters in a so the result is equal to b, otherwise, return false.
#
# Swapping letters is defined as taking two indices i and j (0-indexed) such that i != j and swapping the characters at a[i] and b[j]. For example, swapping at indices 0 and 2 in "abcd" results in "cbad".
#
# Example 1:
#
# Input: a = "ab", b = "ba"
# Output: true
# Explanation: You can swap a[0] = 'a' and a[1] = 'b' to get "ba", which is equal to b.
#
# Example 2:
#
# Input: a = "ab", b = "ab"
# Output: false
# Explanation: The only letters you can swap are a[0] = 'a' and a[1] = 'b', which results in "ba" != b.
#
# Example 3:
#
# Input: a = "aa", b = "aa"
# Output: true
# Explanation: You can swap a[0] = 'a' and a[1] = 'a' to get "aa", which is equal to b.
#
# Example 4:
#
# Input: a = "aaaaaaabc", b = "aaaaaaacb"
# Output: true

#
# Approach 1: Enumerate Cases
#

# If two strings are equal there could be one swap if at least one character is duplicated.
# If strings not equal there must be exactly 2 indices i and j where elements from two strings
# do not match. But a[i] == b[j] && b[j] == a[i]. To check this condition an array of unmatched
# indices created.

# Complexity Analysis
#
# Time Complexity: O(N), where N is the length of A and B.
# Space Complexity: O(1).

# @param {String} a
# @param {String} b
# @return {Boolean}
def buddy_strings(a, b)
  return false if a.size != b.size
  return false if a.size < 2

  hash = {}
  result = []
  duplicates = false

  a.chars.each_with_index do |v, i|
    duplicates = true if hash[v]

    hash[v] = true

    return false if result.size > 2

    result.push(i) if v != b[i]
  end

  return duplicates if result.empty?
  return false if result.size != 2

  i , j = result

  return a[i] == b[j] && a[j] == b[i]
end

a = "ab"
b = "ba"
puts buddy_strings(a, b)
# Output: true
# Explanation: You can swap a[0] = 'a' and a[1] = 'b' to get "ba", which is equal to b.

a = "ab"
b = "ab"
puts buddy_strings(a, b)
# Output: false
# Explanation: The only letters you can swap are a[0] = 'a' and a[1] = 'b', which results in "ba" != b.

a = "aa"
b = "aa"
puts buddy_strings(a, b)
# Output: true
# Explanation: You can swap a[0] = 'a' and a[1] = 'a' to get "aa", which is equal to b.

a = "aaaaaaabc"
b = "aaaaaaacb"
puts buddy_strings(a, b)
# Output: true
