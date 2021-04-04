# Write an algorithm to determine if a number n is happy.
#
# A happy number is a number defined by the following process:
#
# Starting with any positive integer, replace the number by the sum of the
# squares of its digits. Repeat the process until the number equals 1 (where
# it will stay), or it loops endlessly in a cycle which does not include 1.
# Those numbers for which this process ends in 1 are happy.
# Return true if n is a happy number, and false if not.
#
# Example 1:
#
# Input: n = 19
# Output: true
# Explanation:
# 12 + 92 = 82
# 82 + 22 = 68
# 62 + 82 = 100
# 12 + 02 + 02 = 1
#
# Example 2:
#
# Input: n = 2
# Output: false

#
# Approach 1: Detect Cycles with a HashSet
#

# Algorithm
#
# There are 2 parts to the algorithm we'll need to design and code.
#
# Given a number nn, what is its next number?
# Follow a chain of numbers and detect if we've entered a cycle.
# Part 1 can be done by using the division and modulus operators to repeatedly
# take digits off the number until none remain, and then squaring each removed
# digit and adding them together. Have a careful look at the code for this,
# "picking digits off one-by-one" is a useful technique you'll use for solving
# a lot of different problems.
#
# Part 2 can be done using a HashSet. Each time we generate the next number in
# the chain, we check if it's already in our HashSet.
#
# If it is not in the HashSet, we should add it.
# If it is in the HashSet, that means we're in a cycle and so should return false.
# The reason we use a HashSet and not a Vector, List, or Array is because we're
# repeatedly checking whether or not numbers are in it. Checking if a number is
# in a HashSet takes O(1) time, whereas for the other data structures it
# takes O(n) time. Choosing the correct data structures is an essential part of
# solving these problems.

# Complexity Analysis
#
# Determining the time complexity for this problem is challenging for an "easy"
# level question. If you're new to these problems, have a go at calculating the
# time complexity for just the getNext(n) function (don't worry about how many
# numbers will be in the chain).
#
# Time complexity: (243⋅3+logn+loglogn+logloglogn)... = O(logn).
# Space complexity: O(logn).

# @param {Integer} n
# @return {Boolean}
def is_happy(n)
  temp = Array.new(0)

  loop do
    sum = 0
    n.to_s.chars.map(&:to_i).each {|x| sum += x*x}

    return true if sum == 1
    return false if temp.include?(sum)

    temp << sum
    n = sum
  end
end

n = 19
puts is_happy(n)
# true
