# Given an integer array nums, design an algorithm to randomly shuffle the array.
#
# Implement the Solution class:
#
# Solution(int[] nums) Initializes the object with the integer array nums.
# int[] reset() Resets the array to its original configuration and returns it.
# int[] shuffle() Returns a random shuffling of the array.
#
# Example 1:
#
# Input
# ["Solution", "shuffle", "reset", "shuffle"]
# [[[1, 2, 3]], [], [], []]
# Output
# [null, [3, 1, 2], [1, 2, 3], [1, 3, 2]]
#
# Explanation
# Solution solution = new Solution([1, 2, 3]);
# solution.shuffle();    // Shuffle the array [1,2,3] and return its result. Any permutation of [1,2,3] must be equally likely to be returned. Example: return [3, 1, 2]
# solution.reset();      // Resets the array back to its original configuration [1,2,3]. Return [1, 2, 3]
# solution.shuffle();    // Returns the random shuffling of array [1,2,3]. Example: return [1, 3, 2]
#
#
# Constraints:
#
# 1 <= nums.length <= 200
# -106 <= nums[i] <= 106
# All the elements of nums are unique.
# At most 5 * 104 calls will be made to reset and shuffle.


# Intuition
#
# We can cut down the time and space complexities of shuffle with a bit of cleverness - namely, by swapping elements around within the array itself, we can avoid the linear space cost of the auxiliary array and the linear time cost of list modification.
#
# Algorithm
#
# The Fisher-Yates algorithm is remarkably similar to the brute force solution. On each iteration of the algorithm, we generate a random integer between the current index and the last index of the array. Then, we swap the elements at the current index and the chosen index - this simulates drawing (and removing) the element from the hat, as the next range from which we select a random index will not include the most recently processed one. One small, yet important detail is that it is possible to swap an element with itself - otherwise, some array permutations would be more likely than others. To see this illustrated more clearly, consider the animation below:

# Complexity Analysis
#
# Time complexity: O(n)
# The Fisher-Yates algorithm runs in linear time, as generating a random index and swapping two values can be done in constant time.
#
# Space complexity: O(n)
# Although we managed to avoid using linear space on the auxiliary array from the brute force approach, we still need it for reset, so we're stuck with linear space complexity.


class Solution
  # :type nums: Integer[]
  def initialize(nums)
    @nums = nums
  end

  # Resets the array to its original configuration and return it.
  # :rtype: Integer[]
  def reset
    @nums
  end

  # Returns a random shuffling of the array.
  # :rtype: Integer[]
  def shuffle
    shuf = @nums.clone
    l = shuf.length
    (0...l).each do |i|
      rand  = rand(i...l)
      shuf[i], shuf[rand] = shuf[rand], shuf[i]
    end
    shuf
  end
end

obj = Solution.new(nums)
param_1 = obj.reset
param_2 = obj.shuffle
