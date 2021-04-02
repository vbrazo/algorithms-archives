# Given an input string s, reverse the order of the words.
#
# A word is defined as a sequence of non-space characters. The words in s will be separated by at least one space.
#
# Return a string of the words in reverse order concatenated by a single space.
#
# Note that s may contain leading or trailing spaces or multiple spaces between two words. The returned string should only have a single space separating the words. Do not include any extra spaces.
#
# Example 1:
#
# Input: s = "the sky is blue"
# Output: "blue is sky the"
#
# Example 2:
#
# Input: s = "  hello world  "
# Output: "world hello"
# Explanation: Your reversed string should not contain leading or trailing spaces.
#
# Example 3:
#
# Input: s = "a good   example"
# Output: "example good a"
# Explanation: You need to reduce multiple spaces between two words to a single space in the reversed string.
#
# Example 4:
#
# Input: s = "  Bob    Loves  Alice   "
# Output: "Alice Loves Bob"
#
# Example 5:
#
# Input: s = "Alice does not even like bob"
# Output: "bob like even not does Alice"

#
# Approach 1: Built-in Split + Reverse
#

# Complexity Analysis
#
# Time complexity: O(N), where N is a number of characters in the input string.
# Space complexity: O(N), to store the result of split by spaces.

# @param {String} s
# @return {String}
def reverse_words(s)
  s.split(" ").reverse.join(" ")
end

s = "the sky is blue"
puts reverse_words(s)
# Output: "blue is sky the"

s = "  hello world  "
puts reverse_words(s)
# Output: "world hello"

s = "a good   example"
puts reverse_words(s)
# Output: "example good a"

s = "  Bob    Loves  Alice   "
puts reverse_words(s)
# Output: "Alice Loves Bob"

s = "Alice does not even like bob"
puts reverse_words(s)
# Output: "bob like even not does Alice"
