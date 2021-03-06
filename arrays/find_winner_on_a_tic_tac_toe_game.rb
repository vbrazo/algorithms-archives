# Tic-tac-toe is played by two players A and B on a 3 x 3 grid.
#
# Here are the rules of Tic-Tac-Toe:
#
# Players take turns placing characters into empty squares (" ").
# The first player A always places "X" characters, while the second player B always places "O" characters.
# "X" and "O" characters are always placed into empty squares, never on filled ones.
# The game ends when there are 3 of the same (non-empty) character filling any row, column, or diagonal.
# The game also ends if all squares are non-empty.
# No more moves can be played if the game is over.
# Given an array moves where each element is another array of size 2 corresponding to the row and column of the grid where they mark their respective character in the order in which A and B play.
#
# Return the winner of the game if it exists (A or B), in case the game ends in a draw return "Draw", if there are still movements to play return "Pending".
#
# You can assume that moves is valid (It follows the rules of Tic-Tac-Toe), the grid is initially empty and A will play first.
#
# Example 1:
#
# Input: moves = [[0,0],[2,0],[1,1],[2,1],[2,2]]
# Output: "A"
# Explanation: "A" wins, he always plays first.
# "X  "    "X  "    "X  "    "X  "    "X  "
# "   " -> "   " -> " X " -> " X " -> " X "
# "   "    "O  "    "O  "    "OO "    "OOX"
#
# Example 2:
#
# Input: moves = [[0,0],[1,1],[0,1],[0,2],[1,0],[2,0]]
# Output: "B"
# Explanation: "B" wins.
# "X  "    "X  "    "XX "    "XXO"    "XXO"    "XXO"
# "   " -> " O " -> " O " -> " O " -> "XO " -> "XO "
# "   "    "   "    "   "    "   "    "   "    "O  "
#
# Example 3:
#
# Input: moves = [[0,0],[1,1],[2,0],[1,0],[1,2],[2,1],[0,1],[0,2],[2,2]]
# Output: "Draw"
# Explanation: The game ends in a draw since there are no moves to make.
# "XXO"
# "OOX"
# "XOX"
#
# Example 4:
#
# Input: moves = [[0,0],[1,1]]
# Output: "Pending"
# Explanation: The game has not finished yet.
# "X  "
# " O "
# "   "
#
# Constraints:
#
# 1 <= moves.length <= 9
# moves[i].length == 2
# 0 <= moves[i][j] <= 2
# There are no repeated elements on moves.
# moves follow the rules of tic tac toe.

#
# Approach 1: Checking for the explicit winning condition
#

def tictactoe(moves)
  a_moves = []
  b_moves = []
  winning_conditions = [
    [[0, 0], [0, 1], [0, 2]],
    [[1, 0], [1, 1], [1, 2]],
    [[2, 0], [2, 1], [2, 2]],
    [[0, 0], [1, 0], [2, 0]],
    [[0, 1], [1, 1], [2, 1]],
    [[0, 2], [1, 2], [2, 2]],
    [[0, 0], [1, 1], [2, 2]],
    [[0, 2], [1, 1], [2, 0]]
  ]

  moves.each_with_index do |move, index|
    if index.even?
      a_moves << move
    else
      b_moves << move
    end
  end

  winning_conditions.each do |wc|
    if (wc & a_moves).size == 3
      return "A"
    elsif (wc & b_moves).size == 3
      return "B"
    end
  end

  moves.size == 9 ? "Draw" : "Pending"
end

moves = [[0, 0], [2, 0], [1, 1], [2, 1], [2, 2]]
tictactoe(moves)
# Output: "A"
# Explanation: "A" wins, he always plays first.
# "X  "    "X  "    "X  "    "X  "    "X  "
# "   " -> "   " -> " X " -> " X " -> " X "
# "   "    "O  "    "O  "    "OO "    "OOX"
#

moves = [[0, 0], [1, 1], [0, 1], [0, 2], [1, 0], [2, 0]]
tictactoe(moves)
# Output: "B"
# Explanation: "B" wins.
# "X  "    "X  "    "XX "    "XXO"    "XXO"    "XXO"
# "   " -> " O " -> " O " -> " O " -> "XO " -> "XO "
# "   "    "   "    "   "    "   "    "   "    "O  "
#

moves = [[0, 0], [1, 1], [2, 0], [1, 0], [1, 2], [2, 1], [0, 1], [0, 2], [2, 2]]
tictactoe(moves)
# Output: "Draw"
# Explanation: The game ends in a draw since there are no moves to make.
# "XXO"
# "OOX"
# "XOX"
#

moves = [[0, 0], [1, 1]]
tictactoe(moves)
# Output: "Pending"
# Explanation: The game has not finished yet.
# "X  "
# " O "
# "   "

#
# Approach 2: Using matrix library
#

require "matrix"

class Matrix
  def rotate
    Matrix[*to_a.map(&:reverse).transpose]
  end
end

PLAYER = %w[A B]

# @param {Integer[][]} moves
# @return {String}
def tictactoe(moves)
  grid = [[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]]
  moves.each_with_index do |(i, j), index|
    grid[i][j] = PLAYER[index % 2]
  end
  result(grid)
end

def result(grid)
  if winner = horizontal(grid) || vertical(grid) || diag(grid)
    winner.first
  elsif pending?(grid)
    "Pending"
  else
    "Draw"
  end
end

def horizontal(grid)
  winner(grid)
end

def vertical(grid)
  winner(grid.transpose)
end

def diag(grid)
  winner([Matrix.rows(grid).each(:diagonal).to_a,
          Matrix.rows(grid).rotate.each(:diagonal).to_a])
end

# checking for a move played three times
def winner(rows)
  rows.find {|row| row.compact.size == 3 && row.uniq.size == 1 }
end

def pending?(grid)
  grid.flatten.any?(&:nil?)
end

moves = [[0, 0], [2, 0], [1, 1], [2, 1], [2, 2]]
tictactoe(moves)
# Output: "A"
# Explanation: "A" wins, he always plays first.
# "X  "    "X  "    "X  "    "X  "    "X  "
# "   " -> "   " -> " X " -> " X " -> " X "
# "   "    "O  "    "O  "    "OO "    "OOX"
#

moves = [[0, 0], [1, 1], [0, 1], [0, 2], [1, 0], [2, 0]]
tictactoe(moves)
# Output: "B"
# Explanation: "B" wins.
# "X  "    "X  "    "XX "    "XXO"    "XXO"    "XXO"
# "   " -> " O " -> " O " -> " O " -> "XO " -> "XO "
# "   "    "   "    "   "    "   "    "   "    "O  "
#

moves = [[0, 0], [1, 1], [2, 0], [1, 0], [1, 2], [2, 1], [0, 1], [0, 2], [2, 2]]
tictactoe(moves)
# Output: "Draw"
# Explanation: The game ends in a draw since there are no moves to make.
# "XXO"
# "OOX"
# "XOX"
#

moves = [[0, 0], [1, 1]]
tictactoe(moves)
# Output: "Pending"
# Explanation: The game has not finished yet.
# "X  "
# " O "
# "   "
