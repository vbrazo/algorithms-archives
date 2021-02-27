# You are climbing a staircase. It takes n steps to reach the top.

# Each time you can either climb 1 or 2 steps.
# In how many distinct ways can you climb to the top?

#
# Approach 1: Brute Force
#

# Algorithm
#
# In this brute force approach we take all possible step combinations i.e.
# 1 and 2, at every step. At every step we are calling the
# function climbStairsclimbStairs for step 1 and 2, and return the sum
# of returned values of both functions.
#
# climb_stairs(i, n) = (i + 1, n) + climbStairs(i + 2, n)
#
# where i defines the current step and nn defines the destination step.
#
# Complexity Analysis
#
# Time complexity: O(2^n). Size of recursion tree will be 2^n.
# Space complexity: O(n). The depth of the recursion tree can go upto n.
#
# Recursion tree for n=5 would be like this:

# @param {Integer} n
# @return {Integer}
def climb_stairs(n)
  climb(0, n)
end

def climb(i, n)
  return 0 if i > n

  return 1 if i == n

  climb(i + 1, n) + climb(i + 2, n)
end

n = 2
print(climb_stairs(n))
# => 2
# Explanation: There are two ways to climb to the top.
# 1. 1 step + 1 step
# 2. 2 steps

n = 3
print(climb_stairs(n))
# => 3
# Explanation: There are three ways to climb to the top.
# 1. 1 step + 1 step + 1 step
# 2. 1 step + 2 steps
# 3. 2 steps + 1 step
