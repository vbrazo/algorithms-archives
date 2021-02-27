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

#
# Approach 3: Top-Down Approach using Memoization
#

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

#
# Approach 4: Iterative Top-Down Approach
#

# Intuition
#
# Let's get rid of the need to use all of that space and instead
# use the minimum amount of space required. We can achieve O(1)
# space complexity by only storing the value of the two previous
# numbers and updating them as we iterate to N.
#
# Algorithm
#
# Check if N <= 1, if it is then we should return N.
# Check if N == 2, if it is then we should return 1 since N is 2
# and fib(2-1) + fib(2-2) equals 1 + 0 = 1.
# To use an iterative approach, we need at least 3 variables to
# store each state fib(N), fib(N-1) and fib(N-2).
# Preset the initial values:
# Initialize current with 0.
# Initialize prev1 with 1, since this will represent fib(N-1)
# when computing the current value.
# Initialize prev2 with 1, since this will represent fib(N-2)
# when computing the current value.
# Iterate, incrementally by 1, all the way up to and including N.
# Starting at 3, since 0, 1 and 2 are pre-computed.
# Set the current value to fib(N-1) + fib(N-2) because that is the
# value we are currently computing.
# Set the prev2 value to fib(N-1).
# Set the prev1 value to current_value.
# When we reach N+1, we will exit the loop and return the previously
# set current value.

# Complexity Analysis
#
# Time complexity: O(N). Each value from 2 to N will be visited
# at least once. The time it takes to do this is directly proportionate
# to N where N is the Fibonacci Number we are looking to compute.
#
# Space complexity: O(1). This requires 1 unit of Space for the
# integer N and 3 units of Space to store the computed values
# (curr, prev1 and prev2) for every loop iteration. The amount of
# Space doesn't change so this is constant Space complexity.

def fib(n)
  return n if n <= 1

  return 1 if n == 2

  current = 0
  prev1 = 1
  prev2 = 1

  # Since range is exclusive and we want to include N,
  # we need to put N+1.
  (4..n + 1).each do |_i|
    current = prev1 + prev2
    prev2 = prev1
    prev1 = current
  end

  current
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
# Approach 5: Math
#

# Intuition Using the golden ratio, a.k.a Binet's forumula

# Here's a link to find out more about how the Fibonacci sequence
# and the golden ratio work:
# https://demonstrations.wolfram.com/GeneralizedFibonacciSequenceAndTheGoldenRatio/
#
# We can derive the most efficient solution to this problem using
# only constant time and constant space!
#
# Algorithm
#
# Use the golden ratio formula to calculate the Nth Fibonacci number.

def fib(n)
  golden_ratio = (1 + 5**0.5) / 2
  ((golden_ratio**n + 1) / 5**0.5).to_i
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
