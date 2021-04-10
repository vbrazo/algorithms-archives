# Given a matrix of M x N elements (M rows, N columns), return all elements of the matrix in diagonal order.
# 
# Input:
# [
#  [ 1, 2, 3 ],
#  [ 4, 5, 6 ],
#  [ 7, 8, 9 ]
# ]
# 
# Output: [1,2,4,7,5,3,6,8,9]

# @param {Integer[][]} matrix
# @return {Integer[]}
def find_diagonal_order(matrix)
  return [] if matrix.empty? || matrix[0].empty?

  i = 0
  j = 0
  row_size = matrix.size
  col_size = matrix[0].size
  result = []

  total = row_size * col_size

  total.times do |k|
    result.push matrix[i][j]

    if (i + j).even?
      if j == col_size - 1
        i += 1
      elsif i == 0
        j += 1
      else # go up
        i -= 1
        j += 1
      end
    else # odd
      if i == row_size - 1
        j += 1
      elsif j == 0
        i += 1
      else # go down
        i += 1
        j -= 1
      end
    end
  end

  result
end

a = [
 [ 1, 2, 3 ],
 [ 4, 5, 6 ],
 [ 7, 8, 9 ]
]

print(find_diagonal_order(a))
# Output:  [1,2,4,7,5,3,6,8,9]
