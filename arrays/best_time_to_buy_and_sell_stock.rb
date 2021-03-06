# You are given an array prices where prices[i] is the price of a
# given stock on the ith day.

# You want to maximize your profit by choosing a single day to
# buy one stock and choosing a different day in the future to sell that stock.

# Return the maximum profit you can achieve from this transaction.
# If you cannot achieve any profit, return 0.

# Example 1:
#
# Input: prices = [7,1,5,3,6,4]
# Output: 5
# Explanation: Buy on day 2 (price = 1) and sell on day 5 (price = 6),
# profit = 6-1 = 5.
# Note that buying on day 2 and selling on day 1 is not allowed
# because you must buy before you sell.
#
# Example 2:
#
# Input: prices = [7,6,4,3,1]
# Output: 0
# Explanation: In this case, no transactions are done and the max profit = 0.

# Solution

# We need to find out the maximum difference (which will be the
# maximum profit) between two numbers in the given array. Also,
# the second number (selling price) must be larger than the first
# one (buying price).

# In formal terms, we need to find max(prices[j]−prices[i]),
# for every i and j such that j > i.

#
# Approach 1: Brute Force
#

# Complexity Analysis
#
# Time complexity: O(n^2). Loop runs n(n−1)/2 times.
# Space complexity: O(1). Only two variables - maxprofit and profit are used.
#
# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
  max_profit = 0

  (0...prices.length).each do |i|
    (i + 1...prices.length).each do |j|
      buy_price = prices[i]
      sell_price = prices[j]

      profit = sell_price - buy_price

      max_profit = [max_profit, profit].max
    end
  end

  max_profit
end

prices = [7, 1, 5, 3, 6, 4]
puts(max_profit(prices))

prices = [7, 6, 4, 3, 1]
puts(max_profit(prices))

#
# Approach 2: One Pass
#

# Algorithm
#
# Say the given array is:
# [7, 1, 5, 3, 6, 4]
# If we plot the numbers of the given array on a graph, we get:
# The points of interest are the peaks and valleys in the given graph.
# We need to find the largest peak following the smallest valley.
# We can maintain two variables - minprice and maxprofit corresponding to the
# smallest valley and maximum profit (maximum difference between selling price
# and minprice) obtained so far respectively.

# Complexity Analysis

# Time complexity: O(n). Only a single pass is needed.
# Space complexity: O(1). Only two variables are used.

def max_profit(prices)
  max_profit = 0
  min_price = 1_000_000

  0.upto(prices.length - 1) do |i|
    if prices[i] < min_price
      min_price = prices[i]
    elsif prices[i] - min_price > max_profit
      max_profit = prices[i] - min_price
    end
  end

  max_profit
end

prices = [7, 1, 5, 3, 6, 4]
puts(max_profit(prices))

prices = [7, 6, 4, 3, 1]
puts(max_profit(prices))
