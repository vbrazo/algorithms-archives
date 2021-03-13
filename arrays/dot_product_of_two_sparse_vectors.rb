# Given two sparse vectors, compute their dot product.
#
# Implement class SparseVector:
#
# SparseVector(nums) Initializes the object with the vector nums
# dotProduct(vec) Compute the dot product between the instance of SparseVector
# and vec. A sparse vector is a vector that has mostly zero values, you should
# store the sparse vector efficiently and compute the dot product between two
# SparseVector.
#
# Follow up: What if only one of the vectors is sparse?


# Complexity Analysis
#
# Let n be the length of the input array.
#
# Time complexity: O(n) for both constructing the sparse vector and calculating
# the dot product.
#
# Space complexity: O(1) for constructing the sparse vector as we simply save
# a reference to the input array and O(1) for calculating the dot product.

class SparseVector
  def initialize(nums)
    @nums = nums
  end

  attr_reader :nums

  def dotProduct(vec)
    sum = 0
    vec = vec.nums

    vec.count.times do |pointer|
      multiple = vec[pointer] * nums[pointer]

      sum += multiple if multiple > 0
    end

    sum
  end
end

nums1 = [1, 0, 0, 2, 3]
nums2 = [0, 3, 0, 4, 0]
v1 = SparseVector.new(nums1)
v2 = SparseVector.new(nums2)
ans = v1.dotProduct(v2)
puts(ans)
# Output: 8

nums1 = [0, 1, 0, 0, 0]
nums2 = [0, 0, 0, 0, 2]
v1 = SparseVector.new(nums1)
v2 = SparseVector.new(nums2)
ans = v1.dotProduct(v2)
puts(ans)
# Output: 0

nums1 = [0, 1, 0, 0, 2, 0, 0]
nums2 = [1, 0, 0, 0, 3, 0, 4]
v1 = SparseVector.new(nums1)
v2 = SparseVector.new(nums2)
ans = v1.dotProduct(v2)
puts(ans)
# Output: 6

nums1 = [0, 0, 0, 0, 0, 0, 3, 0, 0, 3, 0, 0, 0]
nums2 = [0, 0, 2, 0, 0, 4, 3, 0, 0, 2, 0, 0, 0]
v1 = SparseVector.new(nums1)
v2 = SparseVector.new(nums2)
ans = v1.dotProduct(v2)
puts(ans)
# Output: 15
