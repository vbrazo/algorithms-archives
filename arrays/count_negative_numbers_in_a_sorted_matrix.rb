# Given a m x n matrix grid which is sorted in non-increasing order both row-wise and column-wise, return the number of negative numbers in grid.
#
# Example 1:
#
# Input: grid = [[4,3,2,-1],[3,2,1,-1],[1,1,-1,-2],[-1,-1,-2,-3]]
# Output: 8
# Explanation: There are 8 negatives number in the matrix.
#
# Example 2:
#
# Input: grid = [[3,2],[1,0]]
# Output: 0
#
# Example 3:
#
# Input: grid = [[1,-1],[-1,-1]]
# Output: 3
#
# Example 4:
#
# Input: grid = [[-1]]
# Output: 1

#
# Approach 1: Brute force
#

# @param {Integer[][]} grid
# @return {Integer}
def count_negatives(grid)
  counter = 0

  grid.each do |arr|
    arr.each do |num|
      counter += 1 if num.negative?
    end
  end

  counter
end

grid = [[4, 3, 2, -1], [3, 2, 1, -1], [1, 1, -1, -2], [-1, -1, -2, -3]]
puts count_negatives(grid)
# Output: 8

grid = [[3, 2], [1, 0]]
puts count_negatives(grid)
# Output: 0

grid = [[1, -1], [-1, -1]]
puts count_negatives(grid)
# Output: 3

grid = [[-1]]
puts count_negatives(grid)
# Output: 1
