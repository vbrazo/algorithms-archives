# Add Digits
#
# Given a non-negative integer num, repeatedly add all its digits until the result has only one digit.
#
# Example:
#
# Input: 38
# Output: 2
# Explanation: The process is like: 3 + 8 = 11, 1 + 1 = 2.
#              Since 2 has only one digit, return it.
# Follow up:
# Could you do it without any loop/recursion in O(1) runtime?

# @param {Integer} num
# @return {Integer}
def add_digits(num)
  sum = num

  until sum < 10
    sum = sum_of_digits(sum)
  end

  sum
end

def sum_of_digits(n)
  a = 0
  sum = 0

  until n.zero?
    a = n % 10
    sum += a
    n /= 10
  end

  sum
end

puts(add_digits(38))
# Output: 2
