# Given a non-negative integer x, compute and return the square root of x.

# Since the return type is an integer, the decimal digits are truncated,
# and only the integer part of the result is returned.

# Approach 1: Binary Search

# Intuition

# Let's go back to the interview context.
# For x≥2 the square root is always smaller than
# x/2 and larger than 0: 0 < a < x/2.
# Since aa is an integer, the problem goes down to the iteration
# over the sorted set of integer numbers. Here the binary search
# enters the scene.

# Algorithm

# If x < 2, return x.
# Set the left boundary to 2, and the right boundary to x / 2.
# While left <= right:
# Take num = (left + right) / 2 as a guess.
# Compute num * num and compare it with x:
# If num * num > x, move the right boundary right = pivot -1
# Else, if num * num < x, move the left boundary left = pivot + 1
# Otherwise num * num == x, the integer square root is here, let's return it
# Return right

# Time complexity: O(log n)

def my_sqrt(x)
  return x if x < 2

  left = 2
  right = x

  while left <= right
    pivot = left + (right - left)
    num = pivot * pivot

    if num > x
      right = pivot - 1
    elsif num < x
      left = pivot + 1
    else
      return pivot
    end
  end

  right
end

x = 4
puts(my_sqrt(x))
# => 2

x = 8
puts(my_sqrt(x))
# => 2

# Approach 2: Recursion + Bit Shifts

# Time complexity: O(log n).

def my_sqrt(x)
  return x if x < 2

  left = my_sqrt(x >> 2) << 1
  right = left + 1

  if right * right > x
    left
  else
    right
  end
end

x = 4
puts(my_sqrt(x))
# => 2

x = 8
puts(my_sqrt(x))
# => 2
