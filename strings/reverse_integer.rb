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

  if x < 0
    -1 * x.to_s.reverse.to_i
  else
    x.to_s.reverse.to_i
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

# Approach 2: using INT_BIT and INT_MAX

# Time Complexity: O(n)

INT_BIT = 32
INT_MAX = 2**(INT_BIT - 1) - 1

# @param {Integer} x
# @return {Integer}
def reverse(x)
  result = 0
  x_remaining = x.abs

  while x_remaining > 0
    result = result * 10 + x_remaining % 10
    x_remaining /= 10
  end

  result = x < 0 ? -result : result

  if result < 0
    result < -INT_MAX ? 0 : result
  else
    result > INT_MAX ? 0 : result
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
