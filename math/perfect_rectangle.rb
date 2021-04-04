# Given an array rectangles where rectangles[i] = [xi, yi, ai, bi] represents
# an axis-aligned rectangle. The bottom-left point of the rectangle is (xi, yi)
# and the top-right point of it is (ai, bi).
# Return true if all the rectangles together form an exact cover of a rectangular region.

#
# Approach 1: Using coordinates
# 

# @param {Integer[][]} rectangles
# @return {Boolean}
def is_rectangle_cover(rectangles)
  coordinates = Hash.new(0)
  area_of_all_rectangles = 0

  rectangles.each do |rectangle|
    # add corners of individual rectangles, and count their occurrence on combined rectangle
    coordinates[[rectangle[0],rectangle[1]]] += 1
    coordinates[[rectangle[0],rectangle[3]]] += 1
    coordinates[[rectangle[2],rectangle[3]]] += 1
    coordinates[[rectangle[2],rectangle[1]]] += 1

    area_of_all_rectangles += area(rectangle)
  end

  # Find out corners after combining all rectangles
  # in perfect rectangle, we should have just 4
  corners_to_verify = coordinates.select{|c, v| v == 1}.keys
  return false if corners_to_verify.count != 4

  # Find corners of combined rectangle:
  min_x, min_y = (coordinates.first[0])
  max_x, max_y = (coordinates.first[0])

  coordinates.keys.each do |x,y|
    min_x = x if x < min_x
    min_y = y if y < min_y
    max_x = x if x > max_x
    max_y = y if y > max_y
  end

  combined_rectangle_coordinates = [[min_x, min_y], [min_x, max_y], [max_x, max_y], [max_x, min_y]]
  combined_rectangle = [min_x, min_y, max_x, max_y]

  # We verify three conditions:
  # 1. all corners should be included in list of corners we have to verify
  # 2. area of all rectangles should be matching with combined_rectangle
  # 3. all corners should have count either equal 1 or divisible by 2
  combined_rectangle_coordinates.all?{|co| corners_to_verify.include?(co)} &&
    area_of_all_rectangles == area(combined_rectangle) &&
    coordinates.all?{|c, v| v == 1 || v % 2 == 0}
end

def area(rectangle)
  (rectangle[2] - rectangle[0]).abs * (rectangle[3] - rectangle[1]).abs
end

rectangles = [[1,1,3,3],[3,1,4,2],[3,2,4,4],[1,3,2,4],[2,3,3,4]]
puts is_rectangle_cover(rectangles)
# true

rectangles = [[1,1,2,3],[1,3,2,4],[3,1,4,2],[3,2,4,4]]
puts is_rectangle_cover(rectangles)
# false

rectangles = [[1,1,3,3],[3,1,4,2],[1,3,2,4],[3,2,4,4]]
puts is_rectangle_cover(rectangles)
# false

rectangles = [[1,1,3,3],[3,1,4,2],[1,3,2,4],[2,2,4,4]]
puts is_rectangle_cover(rectangles)
# false

#
# Approach 2: Using Hash Set
#

require 'set'
def is_rectangle_cover(rectangles)
  corner = {}
  a, b, c, d, area = Float::MAX, Float::MAX, Float::MIN, Float::MIN, 0
  rectangles.each { |x1, y1, x2, y2|
    a, b = x1, y1 if x1 <= a && y1 <= b
    c, d = x2, y2 if x2 >= c && y2 >= d
    area += (x2 - x1) * (y2 - y1)
    [[x1, y1], [x2, y2], [x1, y2], [x2, y1]].each { |p|
        corner[p] = (corner[p] || 0) + 1
    }
  }
  Set[*corner.keys.select { |p| corner[p] % 2 == 1 }] == Set[[a, b], [c, d], [a, d], [c, b]] && area == (c - a) * (d - b)
end

rectangles = [[1,1,3,3],[3,1,4,2],[3,2,4,4],[1,3,2,4],[2,3,3,4]]
puts is_rectangle_cover(rectangles)
# true

rectangles = [[1,1,2,3],[1,3,2,4],[3,1,4,2],[3,2,4,4]]
puts is_rectangle_cover(rectangles)
# false

rectangles = [[1,1,3,3],[3,1,4,2],[1,3,2,4],[3,2,4,4]]
puts is_rectangle_cover(rectangles)
# false

rectangles = [[1,1,3,3],[3,1,4,2],[1,3,2,4],[2,2,4,4]]
puts is_rectangle_cover(rectangles)
# false
