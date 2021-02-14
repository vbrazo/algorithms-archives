# Given integer array nums, return the third maximum number in this array.
# If the third maximum does not exist, return the maximum number.

# Approach 1: Sorting (not a good one)

# Time complexity of sorting is O(n log n) (where n is the length of the input Array).

# @param {Integer[]} nums
# @return {Integer}
def third_max(nums)
  nums = nums.uniq
  if nums.count <= 2
    nums.sort.reverse[0]
  else
    nums.sort.reverse[2]
  end
end

nums = [3,2,1]
print(third_max(nums))
# Output: 1
# Explanation: The third maximum is 1.

nums = [1,2]
print(third_max(nums))
# Output: 2
# Explanation: The third maximum does not exist, so the maximum (2) is returned instead.

nums = [2,2,3,1]
puts(third_max(nums))
# Output: 1
# Explanation: Note that the third maximum here means the third maximum distinct number.
# Both numbers with value 2 are both considered as second maximum.

nums = [1,1,2]
puts(third_max(nums))
# Output: 2


# Approach 2: Seen-Maximums Set

# Intuition

# In the previous approach, we deleted the maximum and second maximum so that
# we could easily find the third maximum. We had to convert the input Array into a
# Set so that duplicates weren't super complicated to handle.
# Instead of deleting items though, we could instead keep a Set of maximums
# we've already seen. Then when we are searching for a maximum, we can ignore
# any values that are already in the seen Set.
# This will also handle duplicates elegantly—if for example we had the input
# set [12, 12, 4, 2, 12, 1], then the first value we'd put into the seen maximums
# Set would be 12. Then when we find the second maximum, the algorithm knows
# to ignore all the 12s.
#
# Complexity Analysis
#
# Time Complexity: O(n).
#
# For each of the three times we find the next maximum, we need to perform an O(n) scan.
# Because there are only, at most, three scans the total time complexity is just O(n).
# The Set operations are all O(1) because there are only at most 3 items in the Set.
#
# Space Complexity: O(1).
#
# Because seenMaximums can contain at most 3 items, the space complexity is only O(1).
require 'set'

def maximum_ignoring_seen_maximums(nums, seen_maximums)
  maximum = nil

  nums.each do |num|
    next if seen_maximums.include? num

    if maximum.nil? || num > maximum
      maximum = num
    end
  end

  maximum
end

def third_max(nums)
  seen_maximums = nums.to_set

  3.times do
    current_maximum = maximum_ignoring_seen_maximums(nums, seen_maximums)

    return seen_maximums.max if current_maximum.nil?

    seen_maximums.add(current_maximum)
  end

  seen_maximums.min
end

nums = [3,2,1]
print(third_max(nums))
# Output: 1
# Explanation: The third maximum is 1.

nums = [1,2]
print(third_max(nums))
# Output: 2
# Explanation: The third maximum does not exist, so the maximum (2) is returned instead.

nums = [2,2,3,1]
puts(third_max(nums))
# Output: 1
# Explanation: Note that the third maximum here means the third maximum distinct number.
# Both numbers with value 2 are both considered as second maximum.

nums = [1,1,2]
puts(third_max(nums))
# Output: 2


# Approach 3: Keep Track of 3 Maximums Using a Set
# Intuition
#
# So far, our approaches have required multiple parses through the input array. While this is still O(n)O(n) in big-oh notation, it'd be good if we could solve it in a single parse. One way is to simply use a Set to keep track of the 3 maximum values we've seen so far. While you could achieve something similar using 3 variables (maximum, secondMaximum, and thirdMaximum), this is messy to work with and is poor programming practice.
#
# For each number in the Array, we add it into the Set of maximums. If this causes there to be more than 3 numbers in the Set, then we evict the smallest number.
#
# At the end, we check whether or not there are 3 numbers in the Set. If there are, this means the third maximum exists, and will be the minimum in the Set. If not, this means there was no third maximum, and so we should return the maximum of the Set, as per the problem requirements.
#

# Complexity Analysis
#
# Time Complexity : O(n).
#
# For each of the nn values in the input Array, we insert it into a Set for a cost of O(1).
# We then sometimes find and remove the minimum of the Set. Because there are never more
# than 33 items in the Set, the time complexity of doing this is O(1).
#
# In total, we're left with O(n).
#
# Space Complexity : O(1).
#
# Because maximums never holds more than 33 items at a time, it is considered to be constant O(1).
require 'set'

def third_max(nums)
  maximums = [].to_set

  nums.each do |num|
    maximums.add(num)
    if maximums.count > 3
      maximums.delete(maximums.min)
    end
  end

  if maximums.count == 3
    return maximums.min
  end

  maximums.max
end


nums = [3,2,1]
print(third_max(nums))
# Output: 1
# Explanation: The third maximum is 1.

nums = [1,2]
print(third_max(nums))
# Output: 2
# Explanation: The third maximum does not exist, so the maximum (2) is returned instead.

nums = [2,2,3,1]
puts(third_max(nums))
# Output: 1
# Explanation: Note that the third maximum here means the third maximum distinct number.
# Both numbers with value 2 are both considered as second maximum.

nums = [1,1,2]
puts(third_max(nums))
# Output: 2
