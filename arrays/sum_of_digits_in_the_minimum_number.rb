# Sum of Digits in the Minimum Number
#
# Given an array A of positive integers, let S be the sum of
# the digits of the minimal element of A.
#
# Return 0 if S is odd, otherwise return 1.
#
# Example 1:
#
# Input: [34,23,1,24,75,33,54,8]
# Output: 0
# Explanation:
# The minimal element is 1, and the sum of those digits is
# S = 1 which is odd, so the answer is 0.
#
# Example 2:
#
# Input: [99,77,33,66,55]
# Output: 1
# Explanation:
# The minimal element is 33, and the sum of those digits is
# S = 3 + 3 = 6 which is even, so the answer is 1.
#

# @param {Integer[]} a
# @return {Integer}
def sum_of_digits(a)
  if digits_sum(min_digit(a)).even?
    1
  else
    0
  end
end

def digits_sum(n)
  a = 0
  sum = 0

  until n.zero?
    a = n % 10
    sum += a
    n /= 10
  end

  sum
end

def min_digit(a)
  min_digit = a[0]

  a.each do |element|
    min_digit = element if element < min_digit
  end

  min_digit
end

a = [34, 23, 1, 24, 75, 33, 54, 8]
puts(sum_of_digits(a))
# Output: 0

a = [99, 77, 33, 66, 55]
puts(sum_of_digits(a))
# Output: 1
