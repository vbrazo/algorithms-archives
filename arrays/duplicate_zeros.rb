# Given a fixed length array arr of integers, duplicate each occurrence of zero,
# shifting the remaining elements to the right.

# Note that elements beyond the length of the original array are not written.
# Do the above modifications to the input array in place,
# do not return anything from your function.

# Approach 1: a brute force solution using a supporting array
def duplicate_zeros(arr)
  arr2 = []
  arr2_index = 0

  arr.each do |value|
    if value == 0
      arr2[arr2_index] = 0
      arr2_index += 1
      arr2[arr2_index] = 0
    else
      arr2[arr2_index] = value
    end

    arr2_index += 1
  end

  print("#{arr2}\n")
end

duplicate_zeros([1, 0, 2, 3, 0, 4, 5, 0])
# Output: null
# Explanation: After calling your function,
# the input array is modified to: [1,0,0,2,3,0,0,4]

duplicate_zeros([1, 2, 3])
# Output: null
# Explanation: After calling your function,
# the input array is modified to: [1,2,3]

# Approach 2: In-place algorithm

# 1. count the number of zeros
# 2. Iterate the array from the end and copy a non-zero element once and zero element twice.
# When we say we discard the extraneous elements, it simply means we start from the left of
# the extraneous elements and start overwriting them with new values, eventually right
# shifting the left over elements and creating space
# for all the duplicated elements in the array.

# Complexity Analysis
# Time Complexity: O(N), where N is the number of elements in the array.
# We do two passes through the array, one to find the number of possible_dups and
# the other to copy the elements. In the worst case we might be iterating the entire array,
# when there are less or no zeros in the array.

# Space Complexity: O(1). We do not use any extra space.

def duplicate_zeros(arr)
  zeros = arr.select { |n| n.zero? }.size

  (arr.size - 1).downto(0) do |pointer|
    if arr[pointer].zero?
      zeros -= 1
    else
      if pointer + zeros < arr.size
        # swap values
        arr[pointer + zeros] = arr[pointer]
      end

      arr[pointer] = 0 if zeros > 0
    end
  end
  print("#{arr}\n")
end

duplicate_zeros([1, 0, 2, 3, 0, 4, 5, 0])
# Output: null
# Explanation: After calling your function,
# the input array is modified to: [1,0,0,2,3,0,0,4]

duplicate_zeros([1, 2, 3])
# Output: null
# Explanation: After calling your function,
# the input array is modified to: [1,2,3]
