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

#
# Approach 2: Binary search
#

# @param {Integer[][]} grid
# @return {Integer}
def count_negatives(grid)
  cols = grid[0].length
  rows = grid.length
  count = 0

  rows.each do |i|
    if grid[i][0] < 0
      count += cols
      next
    end

    next if grid[i][cols - 1] > 0

    left = 0
    right = cols - 1

    while left <= right
      mid = (left + right) / 2

      if grid[i][mid] < 0
        if mid == 0 || grid[i][mid - 1] >= 0
          count += (cols - mid)
          break
        end

        right = mid - 1
      else
        left = mid + 1
      end
    end
  end

  count
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
