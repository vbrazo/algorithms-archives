# Arrays - Get Products of all other elements in Ruby

# Algorithm challenge description:
# Given an array of integers, return a new array such that
# each element at index `i` of the new array is the product of
# all the numbers in the original array except the one at `i`.

#
# Approach 1: Brute force solution
#
def calculate_products_of_all_other_elements(nums)
  product_of_other_elements = Array.new(nums.length, 1)

  nums.each_with_index do |_num1, i|
    nums.each_with_index do |num2, j|
      product_of_other_elements[i] = product_of_other_elements[i] * num2 if i != j
    end
  end

  product_of_other_elements
end

puts(calculate_products_of_all_other_elements([1, 2, 3]))

# Approach 2: Left and Right product lists

# It's much easier to build an intuition for solving this problem without
# division once you visualize how the different products except self look like
# for each of the elements. So, let's take a look at an example array and the
# different products.

# Looking at the figure about we can figure another way of computing those
# different product values.
#
# Instead of dividing the product of all the numbers in the array by the number
# at a given index to get the corresponding product, we can make use of the product
# of all the numbers to the left and all the numbers to the right of the index.
# Multiplying these two individual products would give us the desired result
# as well.
#
# For every given index, ii, we will make use of the product of all the numbers
# to the left of it and multiply it by the product of all the numbers to the right.
# This will give us the product of all the numbers except the one at the given
# index i. Let's look at a formal algorithm describing this idea more concretely.

# Complexity analysis
#
# Time complexity: O(N) where N represents the number of elements in the input
# array. We use one iteration to construct the array L, one to construct
# the array R and one last to construct the answeranswer array using L and R.
# Space complexity: O(N) used up by the two intermediate arrays that
# we constructed to keep track of product of elements to the left and right.

# Generates prefix products
# prefix_products[i] contains the product of all the elements to the left
# Note: for the element at index '0', there are no elements to the left,
# so the prefix_products[0] would be 1
def build_prefix_products(nums)
  prefix_products = []

  nums.each do |num|
    prefix_products << if prefix_products.count > 0
                         (prefix_products.last * num)
                       else
                         num
                       end
  end

  prefix_products
end

# Generates suffix products
# suffix_products[i] contains the product of all the elements to the right
# Note: for the element at index 'length - 1', there are no elements to the right,
# so the suffix_products[length - 1] would be 1
def build_suffix_products(nums)
  suffix_products = []

  nums.reverse.each do |num|
    suffix_products << if suffix_products.count > 0
                         (suffix_products.last * num)
                       else
                         num
                       end
  end

  suffix_products
end

# Builds output
# For the first element, suffix_products[i] would be product except self
# For the last element of the array, product except self would be prefix_products[i]
# Else, multiple product of all elements to the left and to the right
def output(prefix_products, suffix_products, nums)
  result = []

  nums.reverse.each_with_index do |_num, index|
    result << if index == 0
                suffix_products[index + 1]
              elsif index == nums.length - 1
                prefix_products[index - 1]
              else
                (prefix_products[index - 1] * suffix_products[index + 1])
              end
  end

  result
end

# Generate result from the product of prefixes and suffixes
def products(nums)
  prefix_products = build_prefix_products(nums)
  suffix_products = build_suffix_products(nums)
  suffix_products = suffix_products.reverse

  output(prefix_products, suffix_products, nums)
end

puts(products([1, 2, 3]))
# => [6, 3, 2]
