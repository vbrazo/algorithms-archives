# Given two arrays, write a function to compute their intersection.

# Approach 1: Sort

# You can recommend this method when the input is sorted, or when the output
# needs to be sorted. Here, we sort both arrays (assuming they are not sorted)
# and use two pointers to find common numbers in a single scan.

# Complexity Analysis

# Time Complexity:  O(nlogn+mlogm), where nn and mm are the lengths of the arrays.
# We sort two arrays independently, and then do a linear scan.

# Space Complexity: from O(logn+logm) to O(n+m), depending on the implementation of the
# sorting algorithm. For the complexity analysis purposes, we ignore the memory required
# by inputs and outputs.

# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer[]}
require 'set'

def intersect(nums1, nums2)
  result = []

  i = 0
  j = 0

  nums1 = nums1.sort
  nums2 = nums2.sort

  while i < nums1.length && j < nums2.length
    if nums1[i] < nums2[j]
      i += 1
    elsif nums1[i] > nums2[j]
      j += 1
    elsif nums1[i] == nums2[j]
      result << nums1[i]
      i += 1
      j += 1
    end
  end

  print(result)
end

nums1 = [1, 2, 2, 1]
nums2 = [2, 2]
intersect(nums1, nums2)
# => [2,2]

nums1 = [4, 9, 5]
nums2 = [9, 4, 9, 8, 4]
intersect(nums1, nums2)
# => [4,9]
