# Given a sorted array nums, remove the duplicates in-place such that each element appears only once and returns the new length.
# Do not allocate extra space for another array, you must do this by modifying the input array in-place with O(1) extra mem
#
# Approach: create another array and allocate the values that are not duplicated on it
#

class OutPlaceAlgorithm
  def initialize
    @output_arr = []
  end

  attr_reader :output_arr

  def remove_duplicates(nums)
    return 0 if nums.length.zero?

    length = 0

    nums.each_with_index do |value, index|
      if nums[index - 1] != value
        length += 1
        @output_arr << value
      end
    end

    length
  end
end

algo = OutPlaceAlgorithm.new
nums = [1, 1, 2]
len = algo.remove_duplicates(nums)

puts(len)
print("#{algo.output_arr}\n")

# length = 2
# [1, 2]

#
# Approach: Two Pointers
#
# Since the array is already sorted, we can keep two pointers i and j,
# where i is the slow-runner while j is the fast-runner.
# As long as nums[i] = nums[i] = nums[j], we increment j to skip the duplicate.
# When we encounter nums[j] <> nums[i], the duplicate run has ended so we must copy
# its value to nums[i + 1]. i is then incremented and we repeat the same
# process again until j reaches the end of array.

# Time complextiy: O(n). Assume that n is the length of array. Each of i and j traverses at most n steps.
# Space complexity: O(1).

class InPlaceAlgorithm
  def remove_duplicates(nums)
    return 0 if nums.length.zero?

    pointer1 = 0

    nums.each_with_index do |_, pointer2|
      next unless nums[pointer2] != nums[pointer1]

      pointer1 += 1

      nums[pointer1] = nums[pointer2] # swap values
    end

    pointer1 + 1
  end
end

algo = InPlaceAlgorithm.new
nums = [1, 1, 2]
len = algo.remove_duplicates(nums)

puts(len)
puts("#{nums[0..len + 1]}\n")
print("#{nums[0..len - 1]}\n")

# length = 2
# [1, 2]

nums = [0, 0, 1, 1, 1, 2, 2, 3, 3, 4]
len = algo.remove_duplicates(nums)

puts(len)
puts("#{nums[0..len + 1]}\n")
print("#{nums[0..len - 1]}\n")

# length = 5
# [0, 1, 2, 3, 4, 5]
