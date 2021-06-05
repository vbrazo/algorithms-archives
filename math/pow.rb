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
