# Given a string s, return true if the s can be palindrome after deleting at most one character from it.
#
# Example 1:
#
# Input: s = "aba"
# Output: true
#
# Example 2:
#
# Input: s = "abca"
# Output: true
# Explanation: You could delete the character 'c'.
#
# Example 3:
#
# Input: s = "abc"
# Output: false
#
# Constraints:
#
# 1 <= s.length <= 105
# s consists of lowercase English letters.

#
# Approach 1: Brute Force (with Ruby built-ins)
#

# @param {String} s
# @return {Boolean}
def valid_palindrome_ii(s)
  words = s.chars

  words.each_with_index do |letter, index|
    arr = words.dup
    arr.delete_at(index)

    return true if arr.reverse.join === arr.join
  end

  false
end

s = "aba"
puts valid_palindrome_ii(s)
# Output: true

s = "abca"
puts valid_palindrome_ii(s)
# Output: true

s = "abc"
puts valid_palindrome_ii(s)
# Output: false

#
# Approach 2: Two pointers
#

# Complexity Analysis
#
# Time complexity: O(N)
# Space Complexity: O(1)

# Ruby program to check whether it is possible to make
# string palindrome by removing one character

# Utility method to check if substring from
# low to high is palindrome or not.
def is_palindrome(string, low, high)
  while low < high
    return false if string[low] != string[high]

    low += 1
    high -= 1
  end

  true
end

def valid_palindrome_ii(string)
  low = 0
  high = string.chars.count - 1

  while low < high
    # If both characters are equal then
    # move both pointer towards end
    if string[low] == string[high]
      low += 1
      high -= 1
    else
      # If removing string[low] makes the whole string palindrome.
      # We basically check if substring string[low+1..high] is
      # palindrome or not.
      if is_palindrome(string, low + 1, high)
        return true
      end

      # If removing string[high] makes the whole string palindrome
      # We basically check if substring string[low+1..high] is
      # palindrome or not
      if is_palindrome(string, low, high - 1)
        return true
      end

      return false
    end
  end

  true
end

s = "aba"
puts valid_palindrome_ii(s)
# Output: true

s = "abca"
puts valid_palindrome_ii(s)
# Output: true

s = "abc"
puts valid_palindrome_ii(s)
# Output: false
