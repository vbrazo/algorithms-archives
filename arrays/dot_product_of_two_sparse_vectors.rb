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

#
# Approach 1: Non-efficient Array Approach
#

#
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

#
# Approach 2: Hash set
#

# Intuition

# Store the non-zero values and their corresponding indices in a dictionary,
# with the index being the key. Any index that is not present corresponds to a
# value 0 in the input array.

# Complexity Analysis

# Let n be the length of the input array and L be the number of non-zero elements.

# Time complexity: O(n) for creating the Hash Map;
# O(L) for calculating the dot product.

# Space complexity: O(L) for creating the Hash Map, as we only store
# elements that are non-zero. O(1) for calculating the dot product.

# iterate through each non-zero element in this sparse vector
# update the dot product if the corresponding index has a
# non-zero value in the other vector

class SparseVector
  def initialize(nums)
    @non_zeros = {}

    nums.each_with_index do |num, index|
      non_zeros[index] = num
    end
  end

  attr_reader :non_zeros

  def dotProduct(vec)
    result = 0

    non_zeros.each do |key, value|
      result += value * vec.non_zeros[key]
    end

    result
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

#
# Approach 3: Index-Value Pairs
#

# Intuition
#
# We can also represent elements of a sparse vector as a list of <index, value>
# pairs. We use two pointers to iterate through the two vectors to calculate the
# dot product.

# Complexity Analysis
#
# Let n be the length of the input array and L and L2 be the number of non-zero
# elements for the two vectors.
#
# Time complexity: O(n) for creating the <index, value> pair for non-zero values;
# O(L+L2) for calculating the dot product.
#
# Space complexity: O(L) for creating the <index, value> pairs for non-zero values.
# O(1) for calculating the dot product.
#

class SparseVector
  def initialize(nums)
    pairs = []

    nums.each_with_index do |value, index|
      pairs.push([index, value]) if value != 0
    end

    @pairs = pairs
  end

  attr_reader :pairs

  def dotProduct(vec)
    p = q = result = 0

    while p < pairs.count && q < vec.pairs.count
      if pairs[p][0] == vec.pairs[q][0]
        result += pairs[p][1] * vec.pairs[q][1]

        p += 1
        q += 1
      elsif pairs[p][0] < vec.pairs[q][0]
        p += 1
      else
        q += 1
      end
    end

    result
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
