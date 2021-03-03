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
