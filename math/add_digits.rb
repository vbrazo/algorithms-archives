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

#
# Approach 1: Iterative
#

# @param {Integer} num
# @return {Integer}
def add_digits(num)
  sum = num

  sum = sum_of_digits(sum) until sum < 10

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

#
# Approach 2: Recursive
#

def add_digits(num)
  return num if num < 10

  current_sum = sum_of_digits(num)
  add_digits(current_sum)
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

#
# Approach 3: One-liner
#

def add_digits(num)
  if 0 != num % 9
    num % 9
  else
    (num != 0 ? 9 : 0)
  end
end

puts(add_digits(38))
# Output: 2

#
# Approach 4: Ruby way
#

def add_digits(num)
  num = num.to_s.chars.sum(&:to_i) while num > 9

  num
end

puts(add_digits(38))
# Output: 2
