# Given a non-empty 2D array grid of 0's and 1's, an island is a group of 1's (representing land) connected 4-directionally (horizontal or vertical.) You may assume all four edges of the grid are surrounded by water.
#
# Count the number of distinct islands. An island is considered to be the same as another if and only if one island can be translated (and not rotated or reflected) to equal the other.
#
# Example 1:
# 11000
# 11000
# 00011
# 00011
# Given the above grid map, return 1.
# 
# Example 2:
# 11011
# 10000
# 00001
# 11011
# Given the above grid map, return 3.
#
# Notice that:
# 11
# 1
# and
#  1
# 11
# are considered different island shapes, because we do not consider reflection / rotation.

#
# Approach: BFS
#

def num_distinct_islands(grid)
  visited = {}
  (0...grid.length).each do |i|
    (0...grid[0].length).each do |j|
      if grid[i][j] == 1
        visited[destroy_and_return_path(i, j, grid)] = true
      end
    end
  end
  visited.length
end

def destroy_and_return_path(i, j, grid)
  path = []
  q = Queue.new
  q.push([i, j])
  grid[i][j] = 0
  path.push(0)

  while !q.empty?
    x, y = q.pop

    # right
    if y + 1 < grid[0].length && grid[x][y + 1] == 1
      grid[x][y + 1] = 0
      path.push('r')
      q.push([x, y + 1])
    end

     # down
    if x + 1 < grid.length && grid[x + 1][y] == 1
      grid[x + 1][y] = 0
      path.push('d')
      q.push([x + 1, y])
    end

    # left
    if y - 1 >= 0 && grid[x][y - 1] == 1
      grid[x][y - 1] = 0
      path.push('l')
      q.push([x, y - 1])
    end

    # up
    if x - 1 >= 0 && grid[x - 1][y] == 1
      grid[x - 1][y] = 0
      path.push('u')
      q.push([x - 1, y])
    end

    path.push(0)
  end

  path
end
