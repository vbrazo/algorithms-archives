# Subtract the Product and Sum of Digits of an Integer
#
# Given an integer number n, return the difference between the product of its digits and the sum of its digits.
#
# Example 1:
#
# Input: n = 234
# Output: 15
# Explanation:
# Product of digits = 2 * 3 * 4 = 24
# Sum of digits = 2 + 3 + 4 = 9
# Result = 24 - 9 = 15
#
# Example 2:
#
# Input: n = 4421
# Output: 21
# Explanation:
# Product of digits = 4 * 4 * 2 * 1 = 32
# Sum of digits = 4 + 4 + 2 + 1 = 11
# Result = 32 - 11 = 21

# @param {Integer} n
# @return {Integer}
def subtract_product_and_sum(n)
  nums = populate_array(n)
  calculate(nums)
end

# calculate sum_of_digits and product
def calculate(nums)
  sum_of_digits = 0
  product = 1

  nums.each do |num|
    sum_of_digits += num.to_i
    product *= num.to_i
  end

  product - sum_of_digits
end

# populate array with digits
def populate_array(n)
  nums = []

  until n.zero?
    a = n % 10
    nums.push(a)
    n /= 10
  end

  nums
end


n = 234
puts subtract_product_and_sum(n)
# Output: 15

n = 4421
puts subtract_product_and_sum(n)
# Output: 21
