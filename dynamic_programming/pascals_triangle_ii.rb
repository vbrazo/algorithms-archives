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
