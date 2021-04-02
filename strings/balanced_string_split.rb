# Balanced strings are those that have an equal quantity of 'L' and 'R' characters.
#
# Given a balanced string s, split it in the maximum amount of balanced strings.
#
# Return the maximum amount of split balanced strings.
#
# Example 1:
#
# Input: s = "RLRRLLRLRL"
# Output: 4
# Explanation: s can be split into "RL", "RRLL", "RL", "RL", each substring contains same number of 'L' and 'R'.
#
# Example 2:
#
# Input: s = "RLLLLRRRLR"
# Output: 3
# Explanation: s can be split into "RL", "LLLRRR", "LR", each substring contains same number of 'L' and 'R'.
#
# Example 3:
#
# Input: s = "LLLLRRRR"
# Output: 1
# Explanation: s can be split into "LLLLRRRR".
#
# Example 4:
#
# Input: s = "RLRRRLLRLL"
# Output: 2
# Explanation: s can be split into "RL", "RRRLLRLL", since each substring contains an equal number of 'L' and 'R'
#
#
# Constraints:
#
# 1 <= s.length <= 1000
# s[i] is either 'L' or 'R'.
# s is a balanced string.

# @param {String} s
# @return {Integer}
def balanced_string_split(s)
  balance = 0
  total = 0

  s.chars.each do |c|
    if c == "L"
      balance -= 1
    elsif c == "R"
      balance += 1
    end

    total += 1 if balance == 0
  end

  total
end

s = "RLRRLLRLRL"
puts balanced_string_split(s)
# Output: 4

s = "RLLLLRRRLR"
puts balanced_string_split(s)
# Output: 3

s = "LLLLRRRR"
puts balanced_string_split(s)
# Output: 1

s = "RLRRRLLRLL"
puts balanced_string_split(s)
# Output: 2
