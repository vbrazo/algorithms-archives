# You are given an array of binary strings strs and two integers m and n.
#
# Return the size of the largest subset of strs such that there are at most m 0's and n 1's in the subset.
#
# A set x is a subset of a set y if all elements of x are also elements of y.
#
# Example 1:
#
# Input: strs = ["10","0001","111001","1","0"], m = 5, n = 3
# Output: 4
# Explanation: The largest subset with at most 5 0's and 3 1's is {"10", "0001", "1", "0"}, so the answer is 4.
# Other valid but smaller subsets include {"0001", "1"} and {"10", "1", "0"}.
# {"111001"} is an invalid subset because it contains 4 1's, greater than the maximum of 3.
#
# Example 2:
#
# Input: strs = ["10","0","1"], m = 1, n = 1
# Output: 2
# Explanation: The largest subset is {"0", "1"}, so the answer is 2.

#
# Approach #1 Dynamic Programming [Accepted]
#

# @param {String[]} strs
# @param {Integer} m
# @param {Integer} n
# @return {Integer}
def find_max_form(strs, m, n)
  dp = (m + 1).times.map{[0]*(n + 1)}

  strs.each do |str|
    zeros = str.count('0')
    ones = str.count('1')

    m.downto(zeros) do |i|
      n.downto(ones) do |j|
        dp[i][j] = [dp[i][j], dp[i - zeros][j - ones] + 1].max
      end
    end
  end

  dp[m][n]
end

#
# Approach #2 Using Memoization
#

def find_max_form(strs, m, n)
  selected = strs.map {|str| [str.count("0"), str.count("1")]}

  cache = Array.new(strs.length) { Array.new(m + 1) { Array.new(n + 1) } }

  find_max(selected, 0, m, n, cache)
end

def find_max(arr, i, m, n, cache)
  return 0 if i == arr.length

  zero, one = arr[i]

  cache[i][m][n] ||=
    if zero <= m && one <= n
      [
        find_max(arr, i + 1, m, n, cache),
        1 + find_max(arr, i + 1, m - zero, n - one, cache),
      ].max
    else
      find_max(arr, i + 1, m, n, cache)
    end

  cache[i][m][n]
end
