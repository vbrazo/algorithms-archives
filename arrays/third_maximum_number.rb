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


# Approach 2: Use a Set and Delete Maximums

# We'll work with the following example Array.
#
# [12, 3, 8, 9, 12, 12, 7, 8, 12, 4, 3, 8, 1]
# If there were no duplicates in the Array,
# then a logical strategy would be as follows:
#
# Find the maximum. Delete it.
# Find the new maximum. Delete it.
# Return the *new* maximum.
#
# However, the input Array we're working with could have duplicates.
# To handle this, we can convert the input into a Set first to remove the duplicates.
#
# Converting our input Array example into a Set gives us the following:
#
# {12, 3, 8, 9, 7, 4, 1}
# We then need to find the maximum in the Set. This can be done using a library
# function, or if necessary, your own function that loops through the list keeping
# track of the maximum seen so far, and then returns the maximum at the end.
#
# The maximum from our example is 12.
#
# Now, we need to delete 12 from the Set. This leaves us with:
#
# {3, 8, 9, 7, 4, 1}
# We can then find and remove the second maximum, following the same process.
#
# The second maximum is 9 (the maximum of what's left in the Set).
#
# Removing it leaves us with the following:
#
# {3, 8, 7, 4, 1}
# Finally, we can return the maximum of what's left, which is 8.
#
# Remember that if the third maximum doesn't exist, then we need to return the
# maximum of the original Array. We can detect this situation as soon as we have
# converted the input Array into a Set, because it will contain less than 3 values.

# Complexity Analysis

# Time Complexity: O(n)
# Putting the input Array values into a HashSet has a cost of O(n), as each value
# costs O(1) to place, and there are nn of them.
#
# Finding the maximum in a HashSet has a cost of O(n), as all the values need
# to be looped through. We do this 33 times, giving O(3n) = O(n)O(3⋅n)=O(n)
# as we drop constants in big-oh notation.
# Deleting a value from a HashSet has a cost of O(1), so we can ignore this.
# In total, we're left with O(n) + O(n) = O(n)+O(n)=O(n).
#
# Space Complexity: O(n)
# In the worst case, the HashSet is the same size as the input Array,
# and so requires O(n) space to store.


# @param {Integer[]} nums
# @return {Integer}
require 'set'

def third_max(nums)
  nums = nums.to_set
  maximum = nums.max

  return maximum if nums.length < 3

  nums.delete(maximum)

  second_maximum = nums.max
  nums.delete(second_maximum)

  return nums.max
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
