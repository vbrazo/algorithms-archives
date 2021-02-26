# Determine if a 9 x 9 Sudoku board is valid. Only the filled cells need to be validated according to the following rules:

# Each row must contain the digits 1-9 without repetition.
# Each column must contain the digits 1-9 without repetition.
# Each of the nine 3 x 3 sub-boxes of the grid must contain the digits 1-9 without repetition.

#
# Approach 1: 1-line in Ruby
#

# Note:

# A Sudoku board (partially filled) could be valid but is not necessarily solvable.
# Only the filled cells need to be validated according to the mentioned rules.

# Complexity Analysis

# Time complexity: O(1) since all we do here is just one iteration
# over the board with 81 cells.
# Space complexity: O(1).

# @param {Character[][]} board
# @return {Boolean}
def is_valid_sudoku(board)
 !(0..80).flat_map{|k| (c=board[i=k/9][j=k%9])>'.' ? [[c,i],[j,c],[i/3,j/3,c]] : k}.uniq!
end

board = [["5","3",".",".","7",".",".",".","."]
        ,["6",".",".","1","9","5",".",".","."]
        ,[".","9","8",".",".",".",".","6","."]
        ,["8",".",".",".","6",".",".",".","3"]
        ,["4",".",".","8",".","3",".",".","1"]
        ,["7",".",".",".","2",".",".",".","6"]
        ,[".","6",".",".",".",".","2","8","."]
        ,[".",".",".","4","1","9",".",".","5"]
        ,[".",".",".",".","8",".",".","7","9"]]
print(is_valid_sudoku(board))
# => true

board = [["8","3",".",".","7",".",".",".","."]
        ,["6",".",".","1","9","5",".",".","."]
        ,[".","9","8",".",".",".",".","6","."]
        ,["8",".",".",".","6",".",".",".","3"]
        ,["4",".",".","8",".","3",".",".","1"]
        ,["7",".",".",".","2",".",".",".","6"]
        ,[".","6",".",".",".",".","2","8","."]
        ,[".",".",".","4","1","9",".",".","5"]
        ,[".",".",".",".","8",".",".","7","9"]]
print(is_valid_sudoku(board))
# => false

#
# Approach 2: Using HashSet
#

# Complexity Analysis

# Time complexity: O(1) since all we do here is just one
# iteration over the board with 81 cells.
# Space complexity: O(1).

# @param {Character[][]} board
# @return {Boolean}
require 'set'

def is_valid_sudoku(board)
  return false unless check_rows(board)
  return false unless check_cols(board)

  row = -3
  while (row += 3) < 9
    col = - 3
    while (col += 3) < 9
      start_point = [row, col]
      return false unless check_grid(board, start_point)
    end
  end

  true
end

def check_grid(board, start_point)
  row = start_point[0]
  col = start_point[1]
  ss = Set.new

  (row..(row + 2)).each do |cur_row|
    (col..(col + 2)).each do |cur_col|
      next if board[cur_row][cur_col] == "."
      return false if ss.member?(board[cur_row][cur_col])
      ss.add board[cur_row][cur_col]
    end
  end

  true
end

def check_col(board, col)
  ss = Set.new
  (0..8).each do |row|
    next if board[row][col] == "."
    return false if ss.member?(board[row][col])

    ss.add board[row][col]
  end
  true
end

def check_row(board, row)
  ss = Set.new

  (0..8).each do |col|
    next if board[row][col] == "."
    return false if ss.member?(board[row][col])
    ss.add board[row][col]
  end

  true
end

def check_rows(board)
  (0..8).each do |row|
    return false unless check_row(board, row)
  end

  true
end

def check_cols(board)
  (0..8).each do |col|
    return false unless check_col(board, col)
  end

  true
end

board = [["5","3",".",".","7",".",".",".","."]
        ,["6",".",".","1","9","5",".",".","."]
        ,[".","9","8",".",".",".",".","6","."]
        ,["8",".",".",".","6",".",".",".","3"]
        ,["4",".",".","8",".","3",".",".","1"]
        ,["7",".",".",".","2",".",".",".","6"]
        ,[".","6",".",".",".",".","2","8","."]
        ,[".",".",".","4","1","9",".",".","5"]
        ,[".",".",".",".","8",".",".","7","9"]]
print(is_valid_sudoku(board))
# => true

board = [["8","3",".",".","7",".",".",".","."]
        ,["6",".",".","1","9","5",".",".","."]
        ,[".","9","8",".",".",".",".","6","."]
        ,["8",".",".",".","6",".",".",".","3"]
        ,["4",".",".","8",".","3",".",".","1"]
        ,["7",".",".",".","2",".",".",".","6"]
        ,[".","6",".",".",".",".","2","8","."]
        ,[".",".",".","4","1","9",".",".","5"]
        ,[".",".",".",".","8",".",".","7","9"]]
print(is_valid_sudoku(board))
# => false
