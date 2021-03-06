
# Given an array of positive integers arr, calculate the sum of all possible odd-length subarrays.
#
# A subarray is a contiguous subsequence of the array.
#
# Return the sum of all odd-length subarrays of arr.
#
# Example 1:
#
# Input: arr = [1,4,2,5,3]
# Output: 58
# Explanation: The odd-length subarrays of arr and their sums are:
# [1] = 1
# [4] = 4
# [2] = 2
# [5] = 5
# [3] = 3
# [1,4,2] = 7
# [4,2,5] = 11
# [2,5,3] = 10
# [1,4,2,5,3] = 15
# If we add all these together we get
# 1 + 4 + 2 + 5 + 3 + 7 + 11 + 10 + 15 = 58

# Example 2:
#
# Input: arr = [1,2]
# Output: 3
# Explanation: There are only 2 subarrays of odd length, [1] and [2].
# Their sum is 3.

# Example 3:
#
# Input: arr = [10,11,12]
# Output: 66

# @param {Integer[]} arr
# @return {Integer}
def sum_odd_length_subarrays(arr)
  array_length = arr.length
  sub_start_end_diff = 0
  sum = 0

  while sub_start_end_diff <= array_length
    i = 0
    past_last_sub_start = array_length - sub_start_end_diff

    while (i < past_last_sub_start)
      sum += arr[i..i+sub_start_end_diff].inject(0, :+)
      i += 1
    end

    sub_start_end_diff += 2
  end

  sum
end

arr = [1,4,2,5,3]
sum_odd_length_subarrays(arr)
# Output: 58

arr = [1,2]
sum_odd_length_subarrays(arr)
# Output: 3

arr = [10,11,12]
sum_odd_length_subarrays(arr)
# Output: 66
