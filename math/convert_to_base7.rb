# Given an integer num, return a string of its base 7 representation.
#
# Example 1:
#
# Input: num = 100
# Output: "202"
#
# Example 2:
#
# Input: num = -7
# Output: "-10"

# @param {Integer} num
# @return {String}
def convert_to_base7(num)
  num.to_s(7)
end

num = 100
puts convert_to_base7(num)
# Output: "202"

num = -7
puts convert_to_base7(num)
# Output: "-10"
