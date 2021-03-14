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
  str = s.gsub(/[^a-zA-Z0-9]/, '').downcase

  str.reverse == str
end

s = 'A man, a plan, a canal: Panama'
is_palindrome(s)
# Output: true
# Explanation: "amanaplanacanalpanama" is a palindrome.

s = 'race a car'
is_palindrome(s)
# Output: false
# Explanation: "raceacar" is not a palindrome.

s = 'ab_a'
is_palindrome(s)
# Output: true
# Explanation: "raceacar" is not a palindrome.
