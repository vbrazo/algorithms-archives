# Given two sorted integer arrays nums1 and nums2,
# merge nums2 into nums1 as one sorted array.

# The number of elements initialized in nums1 and nums2 are m and n respectively.
# You may assume that nums1 has enough space (size that is equal to m + n)
# to hold additional elements from nums2.

# Approach 1: The naive approach

# would be to merge both lists into one and then to sort.
# It can be a one line solution with a pretty bad time complexity O((n + m)log(n + m))
# because here one doesn't profit from the fact that both arrays are already sorted.

# Time complexit: O((n + m)log(n + m))
# Space complexity: O(1)

def merge(nums1, m, nums2, n)
  return nums1 if nums2.length == 0

  nums = (nums1 + nums2).select { |num| num.positive? }
  sorted_array = nums.sort

  print("#{sorted_array}")
end

nums1 = [1,2,3,0,0,0]
m = 3

nums2 = [2,5,6]
n = 3

merge(nums1, m, nums2, n)
# => [1,2,2,3,5,6]

nums1 = [1]
m = 1
nums2 = []
n = 0

merge(nums1, m, nums2, n)
# => [1]

#
# Approach 2 : Two pointers / Start from the beginning

# Typically, one could achieve O(n+m) time complexity in a sorted array(s) with the help of two pointers approach.
# The straightforward implementation would be to set get pointer p1 in the beginning of nums1, p2 in the beginning of nums2, and push the smallest value in the output array at each step.
# Since nums1 is an array used for output, one has to keep first m elements of nums1 somewhere aside, that means O(m) space complexity for this approach.




# Approach 3 : Two pointers / Start from the end

# Approach 2 already demonstrates the best possible time complexity O(n+m)
# but still uses an additional space. This is because one has to keep somewhere
# the elements of array nums1 while overwriting it starting from the beginning.
