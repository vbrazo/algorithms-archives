# Given an integer array nums, you need to find one continuous subarray that if you only sort this subarray in ascending order, then the whole array will be sorted in ascending order.
#
# Return the shortest such subarray and output its length.
#
# Example 1:
#
# Input: nums = [2,6,4,8,10,9,15]
# Output: 5
# Explanation: You need to sort [6, 4, 8, 10, 9] in ascending order to make the whole array sorted in ascending order.
#
# Example 2:
#
# Input: nums = [1,2,3,4]
# Output: 0
#
# Example 3:
#
# Input: nums = [1]
# Output: 0
#
# Constraints:
#
# 1 <= nums.length <= 104
# -105 <= nums[i] <= 105
#
#
# Follow up: Can you solve it in O(n) time complexity?

#
# Approach 2: Better Brute Force
#

# Algorithm
#
# In this approach, we make use of an idea based on selection sort.
# We can traverse over the given numsnums array choosing the elements nums[i].
# For every such element chosen, we try to determine its correct position in the
# sorted array. For this, we compare nums[i] with every nums[j], such that
# i < j < n. Here, n refers to the length of nums array.
#
# If any nums[j] happens to be lesser than nums[i], it means both nums[i] and
# nums[j] aren't at their correct position for the sorted array. Thus, we need to
# swap the two elements to bring them at their correct positions. Here, instead
# of swapping, we just note the position of nums[i] (given by i) and nums[j] (given by j).
# These two elements now mark the boundary of the unsorted subarray(at least for the time being).
#
# Thus, out of all the nums[i] chosen, we determine the leftmost nums[i] which
# isn't at its correct position. This marks the left boundary of the smallest
# unsorted subarray(l). Similarly, out of all the nums[j]'s considered for all
# nums[i]'s we determine the rightmost nums[j] which isn't at its correct position.
# This marks the right boundary of the smallest unsorted subarray(r).

# Complexity Analysis
#
# Time complexity: O(n^2). Two nested loops are there.
# Space complexity: O(1). Constant space is used.

def find_unsorted_subarray(nums)
  l = nums.length
  r = 0

  nums.each_with_index do |_num, i|
    (i + 1..nums.count - 1).each do |j|
      if nums[j] < nums[i]
        r = j if j > r
        l = i if l > i
      end
    end
  end

  r - l < 0 ? 0 : r - l + 1
end

nums = [2, 6, 4, 8, 10, 9, 15]
puts find_unsorted_subarray(nums)
# Output: 5
# Explanation: You need to sort [6, 4, 8, 10, 9] in ascending order to make the whole array sorted in ascending order.

nums = [1, 2, 3, 4]
puts find_unsorted_subarray(nums)
# Output: 0

nums = [1]
puts find_unsorted_subarray(nums)
# Output: 0

nums = [2, 1]
puts find_unsorted_subarray(nums)
# Output: 0

#
# Approach 3: Using Sorting
#

# Algorithm
#
# Another very simple idea is as follows. We can sort a copy of the given array nums,
# say given by nums_sorted. Then, if we compare the elements of nums and nums_sorted,
# we can determine the leftmost and rightmost elements which mismatch. The subarray
# lying between them is, then, the required shorted unsorted subarray.

# Complexity Analysis
#
# Time complexity: O(nlogn). Sorting takes nlogn time.
# Space complexity: O(n). We are making copy of original array.

# @param {Integer[]} nums
# @return {Integer}
def find_unsorted_subarray(nums)
  nums_sorted = nums.sort
  high = 0
  low = nil

  (0...nums.length).each do |i|
    if nums[i] != nums_sorted[i]
      low = i
      break
    end
  end

  return 0 if low.nil?

  (nums.length - 1).downto(0) do |i|
    if nums[i] != nums_sorted[i]
      high = i
      break
    end
  end

  high - low + 1
end

nums = [2, 6, 4, 8, 10, 9, 15]
puts find_unsorted_subarray(nums)
# Output: 5
# Explanation: You need to sort [6, 4, 8, 10, 9] in ascending order to make the whole array sorted in ascending order.

nums = [1, 2, 3, 4]
puts find_unsorted_subarray(nums)
# Output: 0

nums = [1]
puts find_unsorted_subarray(nums)
# Output: 0

nums = [2, 1]
puts find_unsorted_subarray(nums)
# Output: 0

#
# Approach 4: Using Stack
#

def find_unsorted_subarray3(nums)
  left = nums.length
  right = 0

  stack = []

  nums.each_with_index do |num, index|
    left = [left, stack.pop].min while !stack.empty? && nums[stack.last] > num
    stack.push index
  end

  stack.clear

  (nums.size - 1).downto(0) do |index|
    right = [right, stack.pop].max while !stack.empty? && nums[stack.last] < nums[index]
    stack.push index
  end

  right > left ? right - left + 1 : 0
end

nums = [2, 6, 4, 8, 10, 9, 15]
puts find_unsorted_subarray(nums)
# Output: 5
# Explanation: You need to sort [6, 4, 8, 10, 9] in ascending order to make the whole array sorted in ascending order.

nums = [1, 2, 3, 4]
puts find_unsorted_subarray(nums)
# Output: 0

nums = [1]
puts find_unsorted_subarray(nums)
# Output: 0

nums = [2, 1]
puts find_unsorted_subarray(nums)
# Output: 0

#
# Approach 5: Without Using Extra Space
#

# Algorithm
#
# The idea behind this method is that the correct position of the minimum element in the unsorted subarray helps to determine the required left boundary. Similarly, the correct position of the maximum element in the unsorted subarray helps to determine the required right boundary.
# Thus, firstly we need to determine when the correctly sorted array goes wrong. We keep a track of this by observing rising slope starting from the beginning of the array. Whenever the slope falls, we know that the unsorted array has surely started. Thus, now we determine the minimum element found till the end of the array numsnums, given by minmin.
# Similarly, we scan the array numsnums in the reverse order and when the slope becomes rising instead of falling, we start looking for the maximum element till we reach the beginning of the array, given by maxmax.
# Then, we traverse over numsnums and determine the correct position of minmin and maxmax by comparing these elements with the other array elements. e.g. To determine the correct position of minmin, we know the initial portion of numsnums is already sorted. Thus, we need to find the first element which is just larger than minmin. Similarly, for maxmax's position, we need to find the first element which is just smaller than maxmax searching in numsnums backwards.

# Complexity Analysis

# Time complexity: O(n). Four O(n) loops are used.
# Space complexity: O(1). Constant space is used.

def find_unsorted_subarray(nums)
  l = 0
  r = nums.length - 1
  min = 10_001
  max = -10_001
  st = 0
  nd = -1

  while r >= 0
    nums[l] >= max ? max = nums[l] : nd = l
    nums[r] <= min ? min = nums[r] : st = r

    l += 1
    r -= 1
  end

  nd - st + 1
end

nums = [2, 6, 4, 8, 10, 9, 15]
puts find_unsorted_subarray(nums)
# Output: 5
# Explanation: You need to sort [6, 4, 8, 10, 9] in ascending order to make the whole array sorted in ascending order.

nums = [1, 2, 3, 4]
puts find_unsorted_subarray(nums)
# Output: 0

nums = [1]
puts find_unsorted_subarray(nums)
# Output: 0

nums = [2, 1]
puts find_unsorted_subarray(nums)
# Output: 0
