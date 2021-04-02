# Given a string s, determine if it is a palindrome,
# considering only alphanumeric characters and ignoring cases.
#
#
# Example 1:
#
# Input: s = "A man, a plan, a canal: Panama"
# Output: true
# Explanation: "amanaplanacanalpanama" is a palindrome.
#
# Example 2:
#
# Input: s = "race a car"
# Output: false
# Explanation: "raceacar" is not a palindrome.
#
# Constraints:
#
# 1 <= s.length <= 2 * 105
# s consists only of printable ASCII characters.

#
# Approach 1: with Ruby functions!
#

# @param {String} s
# @return {Boolean}
def is_palindrome(s)
  str = s.gsub(/[^a-zA-Z0-9]/, "").downcase

  str.reverse == str
end

s = "A man, a plan, a canal: Panama"
is_palindrome(s)
# Output: true
# Explanation: "amanaplanacanalpanama" is a palindrome.

s = "race a car"
is_palindrome(s)
# Output: false
# Explanation: "raceacar" is not a palindrome.

s = "ab_a"
is_palindrome(s)
# Output: true
# Explanation: "raceacar" is not a palindrome.

#
# Approach 2: Compare with reverse
#

# Complexity Analysis
#
# Time complexity: O(n), in length nn of the string.
# We need to iterate thrice through the string: When we filter out
# non-alphanumeric characters, and convert the remaining
# characters to lower-case.  When we reverse the string.  When we compare
# the original and the reversed strings. Each iteration runs linear in time
# (since each character operation completes in constant time). Thus, the effective
# run-time complexity is linear.
#
# Space complexity: O(n), in length nn of the string. We need O(n) additional
# space to stored the filtered string and the reversed string.

# @param {String} s
# @return {Boolean}
def is_palindrome(s)
  str = s.gsub(/[^a-zA-Z0-9]/, "").downcase

  chars = str.chars
  reverse = str.chars.reverse

  chars.each_with_index do |letter, index|
    return false if letter != reverse[index]
  end

  true
end

s = "A man, a plan, a canal: Panama"
is_palindrome(s)
# Output: true
# Explanation: "amanaplanacanalpanama" is a palindrome.

s = "race a car"
is_palindrome(s)
# Output: false
# Explanation: "raceacar" is not a palindrome.

s = "ab_a"
is_palindrome(s)
# Output: true
# Explanation: "raceacar" is not a palindrome.

#
# Approach 3: Two-pointers
#

# Intuition
#
# If you take any ordinary string, and concatenate its reverse to it,
# you'll get a palindrome. This leads to an interesting insight about the
# converse: every palindrome half is reverse of the other half.
#
# Simply speaking, if one were to start in the middle of a palindrome, and
# traverse outwards, they'd encounter the same characters, in the exact same order,
# in both halves!

# Complexity Analysis
#
# Time complexity: O(n), in length nn of the string. We traverse over each
# character at-most once, until the two pointers meet in the middle, or when
# we break and return early.
#
# Space complexity: O(1). No extra space required, at all.

# @param {String} s
# @return {Boolean}
def is_palindrome(s)
  str = s.gsub(/[^a-zA-Z0-9]/, "").downcase

  chars = str.chars
  pointer2 = str.chars.count - 1

  (0..chars.count - 1).each do |pointer1|
    return false if str[pointer1] != str[pointer2]

    pointer2 -= 1
  end

  true
end

# Another way of writing it
def is_palindrome(s)
  return true if s.empty?

  s = s.gsub(/[^0-9a-z]/i, "")

  pointer1 = 0
  pointer2 = s.length - 1

  while pointer1 <= pointer2
    return false unless s[pointer1].downcase == s[pointer2].downcase

    pointer1 += 1
    pointer2 -= 1
  end

  true
end

s = "A man, a plan, a canal: Panama"
puts is_palindrome(s)
# Output: true
# Explanation: "amanaplanacanalpanama" is a palindrome.

s = "race a car"
puts is_palindrome(s)
# Output: false
# Explanation: "raceacar" is not a palindrome.

s = "ab_a"
puts is_palindrome(s)
# Output: true
# Explanation: "raceacar" is not a palindrome.
