# Given a non-empty array of decimal digits representing a non-negative
# integer, increment one to the integer.

# The digits are stored such that the most significant digit is
# at the head of the list, and each element in the array contains
# a single digit.

# You may assume the integer does not contain any leading zero,
# except the number 0 itself.

# Approach 1: Schoolbook Addition with Carry

# Intuition

# Let us identify the rightmost digit which is not equal to nine
# and increase that digit by one. All the following consecutive
# digits of nine should be set to zero.

# Here is the simplest use case which works fine.

# Algorithm

# Move along the input array starting from the end of array.
# Set all the nines at the end of array to zero.
# If we meet a not-nine digit, we would increase it by one.
# The job is done - return digits.
# We're here because all the digits were equal to nine.
# Now they have all been set to zero. We then append the digit 1
# in front of the other digits and return the result.

# @param {Integer[]} digits
# @return {Integer[]}
def plus_one(digits)
  count = digits.count
  pointer = count

  if digits.count == 1
    sum = digits[0] + 1

    if sum == 10
      digits.push(0)
      digits[0] = 1
    else
      digits[0] = sum
    end

    return digits
  end

  while pointer.positive?
    sum = digits[pointer - 1] + 1

    if sum >= 10
      digits[pointer - 1] = 0

      digits.insert(0, 1) if pointer == 1
    else
      digits[pointer - 1] = sum
      break
    end

    pointer -= 1
  end

  digits
end

digits = [1, 2, 3]
print(plus_one(digits))
# => [1,2,4]
# Explanation: The array represents the integer 123.

digits = [4, 3, 2, 1]
print(plus_one(digits))
# => [4,3,2,2]
# Explanation: The array represents the integer 4321.

digits = [0]
print(plus_one(digits))
# => [1]

digits = [9]
print(plus_one(digits))
# => [1, 0]

digits = [9, 9]
print(plus_one(digits))
# => [1, 0]
