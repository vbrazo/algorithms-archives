# Given a string num which represents an integer, return true if num is a strobogrammatic number.
#
# A strobogrammatic number is a number that looks the same when rotated 180 degrees (looked at upside down).
#
# Example 1:
#
# Input: num = "69"
# Output: true
#
# Example 2:
#
# Input: num = "88"
# Output: true
#
# Example 3:
#
# Input: num = "962"
# Output: false
#
# Example 4:
#
# Input: num = "1"
# Output: true
#
#
# Constraints:
#
# 1 <= num.length <= 50
# num consists of only digits.
# num does not contain any leading zeros except for zero itself.

# @param {String} num
# @return {Boolean}
def is_strobogrammatic(num)
  return true if num.length == 0
  a, b = num[0], num[-1]
  sets = [['8','8'],['6','9'],['0','0'],['1','1']]
  sets.each do |set|
    if (a == set[0] && b == set[1]) || (a == set[1] && b == set[0])
      return is_strobogrammatic(num[1..-2])
    end
  end
  return false
end

num = "69"
puts is_strobogrammatic(num)
# Output: true

num = "88"
puts is_strobogrammatic(num)
# Output: true

num = "962"
puts is_strobogrammatic(num)
# Output: false

num = "1"
puts is_strobogrammatic(num)
# Output: true
