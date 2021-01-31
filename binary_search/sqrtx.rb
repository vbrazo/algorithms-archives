# Given a non-negative integer x, compute and return the square root of x.

# Since the return type is an integer, the decimal digits are truncated,
# and only the integer part of the result is returned.

# Approach 1: Pocket Calculator Algorithm

# Time complexity: O(1).
# Space complexity: O(1).

def my_sqrt(x)
  if x < 2
    return x
  end

  left = int(Math::e^(0.5 * Math::log(x)))
  right = left + 1

  if right * right > x
    return left
  else
    return right
  end
end

x = 4
my_sqrt(x)
# => 2

x = 8
my_sqrt(x)
# => 2
