# Letter Combinations of a Phone Number

# Given a string containing digits from 2-9 inclusive, return all possible letter combinations that the number could represent. Return the answer in any order.
# A mapping of digit to letters (just like on the telephone buttons) is given below. Note that 1 does not map to any letters.

# Example 1:
#
# Input: digits = "23"
# Output: ["ad","ae","af","bd","be","bf","cd","ce","cf"]

# Example 2:
#
# Input: digits = ""
# Output: []

# Example 3:
#
# Input: digits = "2"
# Output: ["a","b","c"]

# Constraints:

# 0 <= digits.length <= 4
# digits[i] is a digit in the range ['2', '9'].

#
# Approach 1: Backtracking
#

# Complexity Analysis
#
# Time complexity: O(4^N⋅N), where N is the length of digits.
# Note that 4 in this expression is referring to the maximum value
# length in the hash map, and not to the length of the input.
#
# The worst-case is where the input consists of only 7s and 9s.
# In that case, we have to explore 4 additional paths for every
# extra digit. Then, for each combination, it costs up to N to
# build the combination. This problem can be generalized to a
# scenario where numbers correspond with up to M digits, in
# which case the time complexity would be O(M^N⋅N). For the
# problem constraints, we're given, M = 4M=4, because of
# digits 7 and 9 having 4 letters each.
#
# Space complexity: O(N), where N is the length of digits.
#
# Not counting space used for the output, the extra space we use relative
# to input size is the space occupied by the recursion call stack. It will
# only go as deep as the number of digits in the input since whenever we
# reach that depth, we backtrack.
#
# As the hash map does not grow as the inputs grows, it occupies O(1) space.

PHONE_NUMBER_HASH = {
  "2" => %w[a b c],
  "3" => %w[d e f],
  "4" => %w[g h i],
  "5" => %w[j k l],
  "6" => %w[m n o],
  "7" => %w[p q r s],
  "8" => %w[t u v],
  "9" => %w[w x y z]
}

# @param {String} digits
# @return {String[]}
def letter_combinations(digits)
  results = []

  return results if digits == ""

  backtrack(results, "", digits)

  results
end

def backtrack(results, curr, digits)
  if curr.length == digits.length
    results.push(curr)
  else
    # our next digit is the size of the current string,
    # so if we have one letter "a",
    # then our digit is in pos 1
    digit = digits[curr.length]
    letters = PHONE_NUMBER_HASH[digit]

    0.upto(letters.length - 1) do |i|
      backtrack(results, curr + letters[i], digits)
    end
  end
end

# Example 1:
digits = "23"
print letter_combinations(digits)
# Output: ["ad","ae","af","bd","be","bf","cd","ce","cf"]

# Example 2:
digits = ""
print letter_combinations(digits)
# Output: []

# Example 3:
digits = "2"
print letter_combinations(digits)
# Output: ["a","b","c"]
