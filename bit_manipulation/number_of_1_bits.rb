# Write a function that takes an unsigned integer and returns the number of '1' bits it has (also known as the Hamming weight).

# Note:

# Note that in some languages, such as Java, there is no unsigned integer type. In this case, the input will be given as a signed integer type. It should not affect your implementation, as the integer's internal binary representation is the same, whether it is signed or unsigned.
# In Java, the compiler represents the signed integers using 2's complement notation. Therefore, in Example 3, the input represents the signed integer. -3.
# 
# 
# Example 1:
# 
# Input: n = 00000000000000000000000000001011
# Output: 3
# Explanation: The input binary string 00000000000000000000000000001011 has a total of three '1' bits.
# 
# Example 2:
# 
# Input: n = 00000000000000000000000010000000
# Output: 1
# Explanation: The input binary string 00000000000000000000000010000000 has a total of one '1' bit.
# 
# Example 3:
# 
# Input: n = 11111111111111111111111111111101
# Output: 31
# Explanation: The input binary string 11111111111111111111111111111101 has a total of thirty one '1' bits.
# 

# Approach #1 (Loop and Flip)

# The solution is straight-forward. We check each of the 32 bits of the number.
# If the bit is 1, we add one to the number of 1-bits.
#
# We can check the ith bit of a number using a bit mask. We start with a mask m=1,
# because the binary representation of 1 is,
#
# 0000 0000 0000 0000 0000 0000 0000 000100000000000000000000000000000001 Clearly,
# a logical AND between any number and the mask 1 gives us the least significant bit of
# this number. To check the next bit, we shift the mask to the left by one.
#
# 0000 0000 0000 0000 0000 0000 0000 001000000000000000000000000000000010
#
# And so on.

# Complexity Analysis
# 
# The run time depends on the number of bits in nn. Because nn in this piece of code
# is a 32-bit integer, the time complexity is O(1).
# The space complexity is O(1), since no additional space is allocated.

def hamming_weight(n)
  bits = 0
  mask = 1

  (0..31).each do |i|
    if (n & mask) != 0
      bits += 1
    end

    mask <<= 1
  end

  bits
end


# Approach #2 (Bit Manipulation Trick)

# Algorithm
#
# We can make the previous algorithm simpler and a little faster.
# Instead of checking every bit of the number, we repeatedly flip the
# least-significant 1-bit of the number to 0, and add 1 to the sum. As soon
# as the number becomes 0, we know that it does not have any more 1-bits, and we return the sum.
#
# The key idea here is to realize that for any number nn, doing a bit-wise AND of n and n - 1 flips
# the least-significant 1-bit in n to 0. Why? Consider the binary representations of n and n − 1.

# Complexity Analysis
#
# The run time depends on the number of 1-bits in nn. In the worst case, all bits in nn are 1-bits.
# In case of a 32-bit integer, the run time is O(1).
#
# Space complexity is O(1), since no additional space is allocated.
# In the binary representation, the least significant 1-bit in nn always corresponds
# to a 0-bit in n − 1. Therefore, anding the two numbers nn and n - 1 always
# flips the least significant 1-bit in n to 0, and keeps all other bits the same.
#
# Using this trick, the code becomes very simple.

def hamming_weight(n)
  sum = 0

  while n != 0
    sum += 1
    n &= (n - 1)
  end

  sum
end
