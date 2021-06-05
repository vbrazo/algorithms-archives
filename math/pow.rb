# Challenge name: Pow(x, n)
#
# Implement pow(x, n), which calculates x raised to the power n (i.e., xn).
#
# Example 1:
#
# Input: x = 2.00000, n = 10
# Output: 1024.00000
#
# Example 2:
#
# Input: x = 2.10000, n = 3
# Output: 9.26100
#
# Example 3:
#
# Input: x = 2.00000, n = -2
# Output: 0.25000
# Explanation: 2-2 = 1/22 = 1/4 = 0.25

#
# Approach 1: Fast Power Algorithm Recursive
#

# Complexity Analysis:
#
# Time complexity: O(log n)
# Space complexity: O(log n)

# @param {Float} x
# @param {Integer} n
# @return {Float}
def my_pow(x, n)
  return 0 if x == 0
  return 1 if n == 0

  pow = n > 0 ? n : -n
  result =
    if pow % 2 == 0
      half = my_pow(x, pow / 2) # avoid calculating my_pow(x, pow/2) again
      half * half
    else
      half = my_pow(x, (pow - 1) / 2)
      half * half * x
    end

  n > 0 ? result : 1 / result
end

#
# Approach 2: Fast Power Algorithm Iterative
#

# Complexity Analysis
#
# Time complexity: O(logn). For each bit of n 's binary representation, we will at most multiply once. So the total time complexity is O(logn).
# Space complexity: O(1). We only need two variables for the current product and the final result of x.

# O (log n) solution in Ruby, non-recursive

def my_pow(x, n)
  return 1 if n == 0

  n1 = n < 0 ? -n : n
  x1, res = x, 1

  while true
    res *= x1 if (n1 & 1 == 1)
    x1 *= x1
    n1 >>= 1
    break if n1 == 0
  end

  return (n < 0) ? 1 / res : res
end
