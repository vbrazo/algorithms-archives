#
# Given an integer rowIndex, return the rowIndexth (0-indexed)
# row of the Pascal's triangle.
#

# Example 1:
#
# Input: rowIndex = 3
# Output: [1,3,3,1]
#

# Example 2:
#
# Input: rowIndex = 0
# Output: [1]
#

# Example 3:
#
# Input: rowIndex = 1
# Output: [1,1]
#

def get_num(row, col)
  return 1 if row == 0 || col == 0 || row == col

  get_num(row - 1, col - 1) + get_num(row - 1, col)
end

def get_row(row_index)
  result = []

  (row_index + 1).times do |i|
    result.push(get_num(row_index, i))
  end

  result
end

row_index = 3
print(get_row(row_index))
# => [1,3,3,1]

row_index = 0
print(get_row(row_index))
# => [1]

row_index = 1
print(get_row(row_index))
# => [1,1]

#
# Approach 2: Dynamic Programming
#

# Algorithm
#
# Simple memoization caches results of deep recursive
# calls and provides significant savings on runtime.
# But, it is worth noting that generating a number for a
# particular row requires only two numbers from the previous
# row. Consequently, generating a row only requires numbers
# from the previous row.
# Thus, we could reduce our memory footprint by only keeping
# the latest row generated, and use that to generate a new row.

# Complexity Analysis

# Time complexity: O(k^2).
# Simple memoization would make sure that a particular
# element in a row is only calculated once. Assuming that our
# memoization cache allows constant time lookup and updation
# (like a hash-map), it takes constant time to calculate each
# element in Pascal's triangle.

#
# Complexity Analysis
#
# Space complexity : O(k) + O(k) ~ O(k)
# Saving space by keeping only the latest generated row,
# we need only O(k)O extra space, other than the O(k) space
# required to store the output.

# @param {Integer} row_index
# @return {Integer[]}
def get_row(row_index)
  result = generate(row_index)
  result[result.count - 1]
end

def generate(num_rows)
  return [[1]] if num_rows < 1

  result = [[1], [1, 1]]

  (2...num_rows + 1).each do |row|
    prev = result[row - 1]
    current = [1]
    med = prev.size / 2

    (1...prev.size).each do |i|
      current[i] = prev[i - 1] + prev[i]
    end

    current.push(1)
    result.push(current)
  end

  result
end

#
# Approach 3: Memory-efficient Dynamic Programming
#

# Intuition
#
# Notice that in the previous approach, we have maintained the
# previous row in memory on the premise that we need terms
# from it to build the current row. This is true, but not wholly.
#
# What we actually need, to generate a term in the current row,
# is just the two terms above it (present in the previous row).
#
# Formally, in memory,
# pascal[i][j] = pascal[i-1][j-1] + pascal[i-1][j]
# where pascal[i][j] is the number in ith row and jth column of Pascal's triangle.
# So, trying to compute pascal[i][j], only the memory
# regions of pascal[i-1][j-1] and pascal[i-1][j] are required
# to be accessed.

#
# Complexity Analysis
#
# Time complexity: O(k^2).
# Same as the previous dynamic programming approach.
#
# Space complexity: O(k).
# No extra space is used other than that required to hold
# the output.
#

# @param {Integer} row_index
# @return {Integer[]}
def get_row(row_index)
  pascal = [[1]]
  (1..row_index).each do |i|
    pascal[i] = []
    pascal[i][0] = pascal[i][i] = 1
    (1...i).each do |j|
      pascal[i][j] = pascal[i - 1][j - 1] + pascal[i - 1][j]
    end
  end
  pascal[row_index]
end

row_index = 3
print(get_row(row_index))
# => [1,3,3,1]

row_index = 0
print(get_row(row_index))
# => [1]

row_index = 1
print(get_row(row_index))
# => [1,1]

#
# Approach 4: Math! (specifically, Combinatorics)
#

# Complexity Analysis

# Time complexity: O(k)O.
# Each term is calculated once, in constant time.

# Space complexity: O(k)O.
# No extra space required other than that required to
# hold the output.

def get_row(row_index)
  (0..row_index).map { |num| combination(row_index, num) }
end

def combination(num1, num2)
  factorial(num1) / (factorial(num2) * factorial(num1 - num2))
end

def factorial(num)
  (1..num).inject(1) { |res, i| res * i }
end

row_index = 3
print(get_row(row_index))
# => [1,3,3,1]

row_index = 0
print(get_row(row_index))
# => [1]

row_index = 1
print(get_row(row_index))
# => [1,1]
