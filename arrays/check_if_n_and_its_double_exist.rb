# Given an array arr of integers, check if there exists two integers N and M such
# that N is the double of M (i.e. N = 2 * M).

# Time complexity: O(n^2)

def check_if_exist(arr)
  return false if arr.length == 0

  arr.each_with_index do |value1, i|
    arr.each_with_index do |value2, j|
      next unless value1 * 2 == value2
      return true unless value1 == 0 && i == j
    end
  end
  false
end

arr = [10, 2, 5, 3]
puts(check_if_exist(arr))
# => true
# Explanation: N = 10 is the double of M = 5,that is, 10 = 2 * 5.

arr = [7, 1, 14, 11]
puts(check_if_exist(arr))
# => true
# Explanation: N = 14 is the double of M = 7,that is, 14 = 2 * 7.

arr = [3, 1, 7, 11]
puts(check_if_exist(arr))
# => false
# Explanation: In this case does not exist N and M, such that N = 2 * M.

arr = [-2, 0, 10, -19, 4, 6, -8]
puts(check_if_exist(arr))
# => false

arr = [0, 0]
puts(check_if_exist(arr))
# => true
