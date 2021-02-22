# The Fibonacci numbers, commonly denoted F(n) form a sequence,
# called the Fibonacci sequence, such that each number is the
# sum of the two preceding ones, starting from 0 and 1. That is,

# F(0) = 0, F(1) = 1
# F(n) = F(n - 1) + F(n - 2), for n > 1.
# Given n, calculate F(n).

# Complexity Analysis
#
# Time complexity : O(2^N). This is the slowest way to solve the
# Fibonacci Sequence because it takes exponential time. The amount
# of operations needed, for each level of recursion, grows
# exponentially as the depth approaches N.
#
# Space complexity : O(N). We need space proportionate to N to
# account for the max size of the stack, in memory. This stack keeps
# track of the function calls to fib(N). This has the potential
# to be bad in cases that there isn't enough physical memory to
# handle the increasingly growing stack, leading to a
# StackOverflowError. The Java docs have a good explanation of this,
# describing it as an error that occurs because an application
# recurses too deeply.

# @param {Integer} n
# @return {Integer}
def fib(n)
  return n if n <= 1

  fib(n - 1) + fib(n - 2)
end

n = 2
# Output: 1
# Explanation: F(2) = F(1) + F(0) = 1 + 0 = 1.
puts(fib(n))

n = 3
# Output: 2
# Explanation: F(3) = F(2) + F(1) = 1 + 1 = 2.
puts(fib(n))

n = 4
# Output: 3
# Explanation: F(4) = F(3) + F(2) = 2 + 1 = 3.
puts(fib(n))
