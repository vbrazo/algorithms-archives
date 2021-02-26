# You are given an array prices for which the ith element is the price
# of a given stock on day i.
#
# Find the maximum profit you can achieve. You may complete as many
# transactions as you like (i.e., buy one and sell one share of the
# stock multiple times).
#
# Note: You may not engage in multiple transactions simultaneously
# (i.e., you must sell the stock before you buy again).

# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)

end


prices = [7,1,5,3,6,4]
print(max_profit(prices))
# => 7
# Explanation: Buy on day 2 (price = 1) and sell on day 3 (price = 5),
# profit = 5-1 = 4. Then buy on day 4 (price = 3) and sell on day 5
# (price = 6), profit = 6-3 = 3.

prices = [1,2,3,4,5]
print(max_profit(prices))
# => 4
# Explanation: Buy on day 1 (price = 1) and sell on day 5 (price = 5), profit = 5-1 = 4.
# Note that you cannot buy on day 1, buy on day 2 and sell them later, as you are engaging multiple transactions at the same time. You must sell before buying again.

prices = [7,6,4,3,1]
print(max_profit(prices))
# => 0
# Explanation: In this case, no transaction is done, i.e.,
# max profit = 0.
