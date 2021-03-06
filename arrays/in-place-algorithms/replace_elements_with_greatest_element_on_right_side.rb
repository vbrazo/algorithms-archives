# Given an array arr, replace every element in that array with the greatest element
# among the elements to its right, and replace the last element with -1.
# After doing so, return the array.

# First approach
# Time complexity: O(n^2)

# @param {Integer[]} arr
# @return {Integer[]}
def replace_elements(arr)
  return [-1] if arr.length == 1

  arr.each_with_index do |_value, pointer1|
    max = 0
    (pointer1 + 1..arr.length - 1).each do |pointer2|
      max = arr[pointer2] if max < arr[pointer2]
    end
    arr[pointer1] = max if max != 0
  end
  arr[arr.length - 1] = -1
  arr
end

arr = [17, 18, 5, 4, 6, 1]
puts(replace_elements(arr))
# => [18,6,6,6,1,-1]

arr = [400]
puts(replace_elements(arr))
# => [-1]

# Second approach
# Time complexity: O(n)

# @param {Integer[]} arr
# @return {Integer[]}
def replace_elements(arr)
  return [-1] if arr.length == 1

  new = []
  max = -1

  (arr.length - 1).downto(0) do |i|
    new_max = if max > arr[i]
                max
              else
                arr[i]
              end

    arr[i] = max
    max = new_max
  end

  arr
end

arr = [17, 18, 5, 4, 6, 1]
puts(replace_elements(arr))
# => [18,6,6,6,1,-1]

arr = [400]
puts(replace_elements(arr))
# => [-1]
