# Given a positive integer num, write a function which returns True
# if num is a perfect square else False.


# Approach 1:

# For `num > 2` the square root a is always less than `num / 2` and greater than 1:
# `1 < x < num/2`. Since x is an integer, the problem goes down to the search in
# the sorted set of integer numbers. Binary search is a standard way to proceed in
# such a situation.

# Algorithm
#
# If num < 2, return True.
# Set the left boundary to 2, and the right boundary to num / 2.
# While left <= right:
# Take x = (left + right) / 2 as a guess. Compute guess_squared = x * x and compare it with num:
# If guess_squared == num, then the perfect square is right here, return True.
# If guess_squared > num, move the right boundary right = x - 1.
# Otherwise, move the left boundary left = x + 1.
# If we're here, the number is not a prefect square. Return False.

# Complexity Analysis

# Time complexity: O(log n).
# Space complexity: O(1).

def is_perfect_square(num)
  if num < 2
    return true
  end

  left = 2
  right = num / 2

  while left <= right
    x = left + (right - left) / 2
    guess_squared = x * x
    if guess_squared == num
      return true
    end
    if guess_squared > num
      right = x - 1
    else
      left = x + 1
    end
  end

  return false
end

num = 16
puts(is_perfect_square(num))
# => true

num = 14
puts(is_perfect_square(num))
# => false

#
# Approach 2: Newton's Method
#

def is_perfect_square(num)
  if num < 2
    return true
  end

  x = num / 2
  while x * x > num
    x = (x + num / x) / 2
  end

  return x * x == num
end

num = 16
puts(is_perfect_square(num))
# => true

num = 14
puts(is_perfect_square(num))
# => false

#
# Approach 3
#

def is_perfect_square(num)
  res = num ** 0.5
  res.to_i == res
end

num = 16
puts(is_perfect_square(num))
# => true

num = 14
puts(is_perfect_square(num))
# => false
