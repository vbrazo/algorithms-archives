# Given a signed 32-bit integer x, return x with its digits
# reversed. If reversing x causes the value to go outside
# the signed 32-bit integer range [-231, 231 - 1], then return 0.
# Assume the environment does not allow you to store
# 64-bit integers (signed or unsigned).

# Approach 1: Using ruby features

# Time Complexity: O(n)

# @param {Integer} x
# @return {Integer}
def reverse(x)
  return 0 if (x.to_s.reverse.to_i) > (2**31)
  if x<0
    y = -1*(x.to_s.reverse.to_i)
  else
   y = x.to_s.reverse.to_i
  end
end

x = 123
puts(reverse(x))
# => 321

x = -123
puts(reverse(x))
# => -321

x = 120
puts(reverse(x))
# => 21

x = 0
puts(reverse(x))
# => 0
