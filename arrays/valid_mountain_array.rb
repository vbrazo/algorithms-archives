# Given an array of integers arr, return true if and only if it is a valid mountain array.

# Recall that arr is a mountain array if and only if:

# - arr.length >= 3
#
# There exists some i with 0 < i < arr.length - 1 such that:
#   - arr[0] < arr[1] < ... < arr[i - 1] < arr[i]
#   - arr[i] > arr[i + 1] > ... > arr[arr.length - 1]
#

# Approach 1: One Pass
#
# Intuition
# If we walk along the mountain from left to right, we have to move strictly up, then strictly down.
#
# Algorithm
# Let's walk up from left to right until we can't: that has to be the peak.
# We should ensure the peak is not the first or last element. Then, we walk down.
# If we reach the end, the array is valid, otherwise its not.

# Time Complexity: O(N), where N is the length of A.
# Space Complexity: O(1).

# @param {Integer[]} arr
# @return {Boolean}
def valid_mountain_array(arr)
  n = arr.length
  i = 0

  # walk up
  while i+1 < n and arr[i] < arr[i+1]
    i += 1
  end

  # peak can't be first or last
  if i == 0 or i == n-1
    return false
  end

  # walk down
  while i+1 < n and arr[i] > arr[i+1]
    i += 1
  end

  return i == n-1
end

arr = [2,1]
valid_mountain_array(arr)
# => false

arr = [3,5,5]
valid_mountain_array(arr)
# => false

arr = [0,3,2,1]
valid_mountain_array(arr)
# => true
