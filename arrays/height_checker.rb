# Students are asked to stand in non-decreasing order of heights for an annual photo.
# Return the minimum number of students that must move in order for all students
# to be standing in non-decreasing order of height.

# Notice that when a group of students is selected they can reorder in any possible
# way between themselves and the non selected students remain on their seats.

# @param {Integer[]} heights
# @return {Integer}
def height_checker(heights)
  sorted_heights = heights.sort
  moves = 0

  heights.each_with_index do |height, index|
    if height != sorted_heights[index]
      moves = moves + 1
    end
  end

  moves
end

heights = [1,1,4,2,1,3]
puts(height_checker(heights))
# Output: 3
# Explanation:
# Current array: [1,1,4,2,1,3]
# Target array: [1,1,1,2,3,4]
# On index 2 (0-based) we have 4 vs 1 so we have to move this student.
# On index 4 (0-based) we have 1 vs 3 so we have to move this student.
# On index 5 (0-based) we have 3 vs 4 so we have to move this student.

heights = [5,1,2,3,4]
puts(height_checker(heights))
# Output: 5

heights = [1,2,3,4,5]
puts(height_checker(heights))
# Output: 0
