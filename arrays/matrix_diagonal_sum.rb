# Given a square matrix mat, return the sum of the matrix diagonals.
# Only include the sum of all the elements on the primary diagonal and all the elements on the secondary diagonal that are not part of the primary diagonal.

# Example 1:
# Input: mat = [[1,2,3],
#               [4,5,6],
#               [7,8,9]]
# Output: 25
# Explanation: Diagonals sum: 1 + 5 + 9 + 3 + 7 = 25
# Notice that element mat[1][1] = 5 is counted only once.

# Example 2:
#
# Input: mat = [[1,1,1,1],
#               [1,1,1,1],
#               [1,1,1,1],
#               [1,1,1,1]]
# Output: 8

# Example 3:
#
# Input: mat = [[5]]
# Output: 5

# @param {Integer[][]} mat
# @return {Integer}
def diagonal_sum(mat)
  primary_diagonal = 0
  secondary_diagonal = 0
  j = mat.count - 1

  return mat[0][0] if mat.count == 1

  mat.each_with_index do |value, index|
    primary_diagonal += value[index]
    secondary_diagonal += value[j] if index != j

    j -= 1
  end
  primary_diagonal + secondary_diagonal
end

mat = [[1, 2, 3],
       [4, 5, 6],
       [7, 8, 9]]
diagonal_sum(mat)
# Output: 25

mat = [[1, 1, 1, 1],
       [1, 1, 1, 1],
       [1, 1, 1, 1],
       [1, 1, 1, 1]]
diagonal_sum(mat)
# Output: 8

mat = [[5]]
diagonal_sum(mat)
# Output: 5
