# You are given row x col grid representing a map where grid[i][j] = 1 represents land and grid[i][j] = 0 represents water.
#
# Grid cells are connected horizontally/vertically (not diagonally). The grid is completely surrounded by water, and there is exactly one island (i.e., one or more connected land cells).
#
# The island doesn't have "lakes", meaning the water inside isn't connected to the water around the island. One cell is a square with side length 1. The grid is rectangular, width and height don't exceed 100. Determine the perimeter of the island.
#
# Example 1:
# Input: grid = [[0,1,0,0],[1,1,1,0],[0,1,0,0],[1,1,0,0]]
# Output: 16
# Explanation: The perimeter is the 16 yellow stripes in the image above.
#
# Example 2:
#
# Input: grid = [[1]]
# Output: 4
#
# Example 3:
#
# Input: grid = [[1,0]]
# Output: 4

# Complexity Analysis
#
# Time complexity: O(mn) where mm is the number of rows of the grid and nn is
# the number of columns of the grid. Since two for loops go through all the cells
# on the grid, for a two-dimensional grid of size nm×n, the algorithm would have
# to check mnmn cells.
#
# Space complexity: O(1). Only the result variable is updated and there is no
# other space requirement.

# @param {Integer[][]} grid
# @return {Integer}
# @param {Integer[][]} grid
# @return {Integer}
# @param {Integer[][]} grid
# @return {Integer}
def island_perimeter(grid)
  rows = grid.count
  cols = grid[0].count

  result = 0

  for r in 0..rows - 1
    for c in 0..cols - 1
      if grid[r][c] == 1
        if r == 0
          up = 0
        else
          up = grid[r - 1][c]
        end

        if c == 0
          left = 0
        else
          left = grid[r][c - 1]
        end

        if r == rows-1
          down = 0
        else
          down = grid[r + 1][c]
        end

        if c == cols-1
          right = 0
        else
          right = grid[r][c + 1]
        end

        result += 4 - (up + left + right + down)
      end
    end
  end

  result
end

grid = [[0,1,0,0],[1,1,1,0],[0,1,0,0],[1,1,0,0]]
puts island_perimeter(grid)
# Output: 16

grid = [[1]]
puts island_perimeter(grid)
# Output: 4

grid = [[1,0]]
puts island_perimeter(grid)
# Output: 4

# Complexity Analysis
#
# Time complexity: O(mn) where mm is the number of rows of the grid and n is the number
# of columns of the grid. Since two for loops go through all the cells on the grid, for
# a two-dimensional grid of size m\times nm×n, the algorithm would have to check mn cells.
# 
# Space complexity: O(1). Only the result variable is updated and there is no other space
# requirement.

def island_perimeter(grid)
  rows = grid.count
  cols = grid[0].count
  result = 0

  for r in 0..rows - 1
    for c in 0..cols - 1
      if grid[r][c] == 1
        result += 4

        if r > 0 && grid[r-1][c] == 1
          result -= 2
        end

        if c > 0 && grid[r][c-1] == 1
          result -= 2
        end
      end
    end
  end

  result
end


grid = [[0,1,0,0],[1,1,1,0],[0,1,0,0],[1,1,0,0]]
puts island_perimeter(grid)
# Output: 16

grid = [[1]]
puts island_perimeter(grid)
# Output: 4

grid = [[1,0]]
puts island_perimeter(grid)
# Output: 4
