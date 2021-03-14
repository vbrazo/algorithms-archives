# Given an integer n, return true if it is a power of three. Otherwise,
# return false.

# An integer n is a power of three, if there exists an integer x such
# that n == 3^x.

#
# Approach 1: Loop iteration
#

# One simple way of finding out if a number n is a power of a number b is to
# keep dividing n by b as long as the remainder is 0. This is because we can
# write:
# n=b^x
# n=b×b×…×b
# Hence it should be possible to divide n by b x times, every time with a
# remainder of 0 and the end result to be 1.

# Notice that we need a guard to check that n != 0, otherwise the while loop
# will never finish. For negative numbers, the algorithm does not make sense,
# so we will include this guard as well.

# Complexity Analysis
#
# Time complexity: O(log b(n)). In our case that is O(log(3n)).
# The number of divisions is given by that logarithm.
# Space complexity: O(1). We are not using any additional memory.

def is_power_of_three(n)
  if (n < 1)
    return false
  end

  while n % 3 == 0
    n /= 3
  end

  n == 1
end

n = 27
is_power_of_three(n)
# Output: true

n = 0
is_power_of_three(n)
# Output: false

n = 9
is_power_of_three(n)
# Output: true

n = 45
is_power_of_three(n)
# Output: false
