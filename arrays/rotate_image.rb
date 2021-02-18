# You are given an n x n 2D matrix representing an image,
# rotate the image by 90 degrees (clockwise).

# You have to rotate the image in-place, which means you have to modify
# the input 2D matrix directly. DO NOT allocate another 2D matrix and
# do the rotation.

# Complexity Analysis

# Let M be the number of cells in the matrix.

# Time complexity: O(M), as each cell is getting read once and written once.

# Space complexity: O(1) because we do not use any other additional
# data structures.

def rotate(matrix)
  n = matrix.length
  matrix = transpose(matrix, n)
  reverse_columns(matrix, n)
end

def transpose(matrix, n)
  (0...n).each do |i|
    (i...n).each do |j|
      matrix[i][j], matrix[j][i] = matrix[j][i], matrix[i][j]
    end
  end
  matrix
end

def reverse_columns(matrix, n)
  (0...n).each do |i|
    (0...n / 2).each do |j|
      matrix[i][j], matrix[i][n - j - 1] = matrix[i][n - j - 1], matrix[i][j]
    end
  end

  matrix
end

matrix = [[1]]
print(rotate(matrix))
# Output: [[1]]

matrix = [[1, 2], [3, 4]]
print(rotate(matrix))
# Output: [[3,1],[4,2]]

matrix = [[5, 1, 9, 11], [2, 4, 8, 10], [13, 3, 6, 7], [15, 14, 12, 16]]
print(rotate(matrix))
# Output: [[15,13,2,5],[14,3,4,1],[12,6,8,9],[16,7,10,11]]

matrix = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
print(rotate(matrix))
# Output: [[7,4,1],[8,5,2],[9,6,3]]
