# You have some apples, where arr[i] is the weight of the i-th apple.  You also have a basket that can carry up to 5000 units of weight.
#
# Return the maximum number of apples you can put in the basket.
#
# Example 1:
#
# Input: arr = [100,200,150,1000]
# Output: 4
# Explanation: All 4 apples can be carried by the basket since their sum of weights is 1450.
#
# Example 2:
#
# Input: arr = [900,950,800,1000,700,800]
# Output: 5
# Explanation: The sum of weights of the 6 apples exceeds 5000 so we choose any 5 of them.
#
#
# Constraints:
#
# 1 <= arr.length <= 10^3
# 1 <= arr[i] <= 10^3

#
# Approach 1: Sort
#

# Complexity Analysis
#
# Time Complexity: O(nlogn), where N is the length of the input array. This is determined by the sorting.
# Space Complexity: O(1). This is because we do not use additional data structures.

# @param {Integer[]} arr
# @return {Integer}
def max_number_of_apples(arr)
  arr = arr.sort
  sum = 0
  apples = 0

  (0..arr.count - 1).each do |i|
    temp_sum = sum + arr[i]
    if temp_sum <= 5000
      sum = temp_sum
      apples += 1
    else
      break
    end
  end

  apples
end

arr = [900, 950, 800, 1000, 700, 800]
puts max_number_of_apples(arr)
# Output: 5

arr = [367, 608, 768, 122, 546, 569, 258, 30, 751, 406]
puts max_number_of_apples(arr)
# Output: 10

arr = [988, 641, 984, 635, 461, 527, 491, 610, 274, 104, 348, 468, 220, 837, 126, 111, 536, 368, 89, 201, 589, 481, 849, 708, 258, 853, 563, 868,
       92, 76, 566, 398, 272, 697, 584, 851, 302, 766, 88, 428, 276, 797, 460, 244, 950, 134, 838, 161, 15, 330]
puts max_number_of_apples(arr)
# Output: 7
