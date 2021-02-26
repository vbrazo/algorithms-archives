# The Fibonacci numbers, commonly denoted F(n) form a sequence,
# called the Fibonacci sequence, such that each number is the
# sum of the two preceding ones, starting from 0 and 1. That is,

# F(0) = 0, F(1) = 1
# F(n) = F(n - 1) + F(n - 2), for n > 1.
# Given n, calculate F(n).

#
# Approach 1
#

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

#
# Approach 2: Bottom-Up Approach using Memoization
#

# Intuition

# Improve upon the recursive option by using iteration,
# still solving for all of the sub-problems and returning the
# answer for N, using already computed Fibonacci values.
# In using a bottom-up approach, we can iteratively compute
# and store the values, only returning once we reach the result.

# Complexity Analysis
#
# Time complexity: O(N). Each number, starting at 2 up to and
# including N, is visited, computed and then stored for O(1)
# access later on.
#
# Space complexity: O(N). The size of the data structure is
# proportionate to N.

def fib(n)
  return n if n <= 1

  memoize(n)
end

def memoize(n)
  cache = {}
  cache[0] = 0
  cache[1] = 1

  # Since range is exclusive and we want to include N,
  # we need to put N+1.
  (2..n + 1).each do |i|
    cache[i] = cache[i - 1] + cache[i - 2]
  end

  cache[n]
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

# Approach 3: Top-Down Approach using Memoization

# Intuition
#
# Solve for all of the sub-problems, use memoization to store the
# pre-computed answers, then return the answer for N. We will leverage
# recursion, but in a smarter way by not repeating the work to
# calculate existing values.
#
# Algorithm
#
# Check if N <= 1. If it is, return N.
# Call and return memoize(N)
# If N exists in the map, return the cached value for N
# Otherwise set the value of N, in our mapping, to the value of
# memoize(N-1) + memoize(N-2)

# Complexity Analysis

# Time complexity: O(N). Each number, starting at 2 up to and
# including N, is visited, computed and then stored for O(1) access
# later on.
# Space complexity : O(N). The size of the stack in memory is
# proportionate to N.

def fib(n)
  return n if n <= 1

  cache = {}
  cache[0] = 0
  cache[1] = 1

  memoize(n, cache)
end

def memoize(n, cache)
  return cache[n] if cache.keys.include? n

  cache[n] = memoize(n - 1, cache) + memoize(n - 2, cache)

  memoize(n, cache)
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
