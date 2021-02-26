# You are given an array prices for which the ith element is the price
# of a given stock on day i.
#
# Find the maximum profit you can achieve. You may complete as many
# transactions as you like (i.e., buy one and sell one share of the
# stock multiple times).
#
# Note: You may not engage in multiple transactions simultaneously
# (i.e., you must sell the stock before you buy again).

#
# Approach 1: Brute Force
#
# In this case, we simply calculate the profit corresponding to all the
# possible sets of transactions and find out the maximum profit out of them.
#

def max_profit(prices)
  calculate(prices, 0)
end

def calculate(prices, s)
  return 0 if s >= prices.length

  max = 0
  start = s

  while start < prices.length
    maxprofit = 0
    i = start + 1
    while i < prices.length
      if prices[start] < prices[i]
        profit = calculate(prices, i + 1) + prices[i] - prices[start]
        maxprofit = profit if profit > maxprofit
      end
      i += 1
    end

    max = maxprofit if maxprofit > max

    start += 1
  end

  max
end

prices = [7, 1, 5, 3, 6, 4]
print(max_profit(prices))
# => 7
# Explanation: Buy on day 2 (price = 1) and sell on day 3 (price = 5),
# profit = 5-1 = 4. Then buy on day 4 (price = 3) and sell on day 5
# (price = 6), profit = 6-3 = 3.

prices = [1, 2, 3, 4, 5]
print(max_profit(prices))
# => 4
# Explanation: Buy on day 1 (price = 1) and sell on day 5 (price = 5), profit = 5-1 = 4.
# Note that you cannot buy on day 1, buy on day 2 and sell them later, as you are engaging multiple transactions at the same time. You must sell before buying again.

prices = [7, 6, 4, 3, 1]
print(max_profit(prices))
# => 0
# Explanation: In this case, no transaction is done, i.e.,
# max profit = 0.