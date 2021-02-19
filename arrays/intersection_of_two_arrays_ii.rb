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

# Approach 2: Hash Map

# For the previous problem, we used a hash set to achieve a linear time complexity.
# Here, we need to use a hash map to track the count for each number.

# We collect numbers and their counts from one of the arrays into a hash map.
# Then, we iterate along the second array, and check if the number exists
# in the hash map and its count is positive. If so - add the number to the result
# and decrease its count in the hash map.

# Complexity Analysis

# Time Complexity: O(n+m), where nn and mm are the lengths of the arrays.
# We iterate through the first, and then through the second array; insert
# and lookup operations in the hash map take a constant time.

# Space Complexity: O(min(n,m)). We use hash map to store numbers (and their
# counts) from the smaller array.

def intersect(arr1, arr2)
  ret = []
  hash1 = Hash.new(0)

  arr2.each { |num| hash1[num] += 1 }

  arr1.each do |num|
    if hash1.has_key?(num)
      ret << num if hash1[num] >= 1
      hash1[num] -= 1
    end
  end

  ret
end
