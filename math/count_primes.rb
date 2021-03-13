# Count the number of prime numbers less than a non-negative number, n.

# Example 1:
#
# Input: n = 10
# Output: 4
# Explanation: There are 4 prime numbers less than 10, they are 2, 3, 5, 7.
#
# Example 2:
#
# Input: n = 0
# Output: 0
#
# Example 3:
#
# Input: n = 1
# Output: 0

#
# Approach 1: Brute Force [Time Limit Exceeded]
#

# Let's write down all of 12's factors:
#
# 2 × 6 = 12
# 3 × 4 = 12
# 4 × 3 = 12
# 6 × 2 = 12

# As you can see, calculations of 4 × 3 and 6 × 2 are not necessary.
# Therefore, we only need to consider factors up to √n because,
# if n is divisible by some number p, then n = p × q and since p ≤ q,
# we could derive that p ≤ √n.
#
# Our total runtime has now improved to O(n^1.5), which is slightly
# better. Is there a faster approach?

def count_primes(n)
  count = 0

  n.times do |i|
    count += 1 if is_prime(i)
  end

  count
end

def is_prime(num)
  return false if num <= 1

  # Loop's ending condition is i * i <= num instead of i <= sqrt(num)
  # to avoid repeatedly calling an expensive function sqrt().
  i = 2

  while i * i <= num
    return false if num % i == 0

    i += 1
  end

  true
end

puts(count_primes(10))
# Output: 4

puts(count_primes(3))
# Output: 1

puts(count_primes(2))
# Output: 1

puts(count_primes(4))
# Output: 1

#
# Approach 2: Sieve of Eratosthenes
# https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes
#

# The Sieve of Eratosthenes is one of the most efficient ways to find
# all prime numbers up to n. But don't let that name scare you, I
# promise that the concept is surprisingly simple.

# We start off with a table of n numbers. Let's look at the first
# number, 2. We know all multiples of 2 must not be primes, so we mark
# them off as non-primes. Then we look at the next number, 3. Similarly,
# all multiples of 3 such as 3 × 2 = 6, 3 × 3 = 9, ... must not be primes,
# so we mark them off as well. Now we look at the next number, 4, which
# was already marked off. What does this tell you? Should you mark off
# all multiples of 4 as well?

# 4 is not a prime because it is divisible by 2, which means all
# multiples of 4 must also be divisible by 2 and were already marked
# off. So we can skip 4 immediately and go to the next number, 5.
# Now, all multiples of 5 such as
# 5 × 2 = 10, 5 × 3 = 15, 5 × 4 = 20, 5 × 5 = 25, ...
# can be marked off. There is a slight optimization here, we do not
# need to start from 5 × 2 = 10. Where should we start marking off?

# In fact, we can mark off multiples of 5 starting at 5 × 5 = 25,
# because 5 × 2 = 10 was already marked off by multiple of 2, similarly
# 5 × 3 = 15 was already marked off by multiple of 3. Therefore, if
# the current number is p, we can always mark off multiples of p
# starting at p2, then in increments of p: p2 + p, p2 + 2p, ... Now
# what should be the terminating loop condition?

# It is easy to say that the terminating loop condition is p < n,
# which is certainly correct but not efficient.

# Yes, the terminating loop condition can be p < √n, as all
# non-primes ≥ √n must have already been marked off. When the loop
# terminates, all the numbers in the table that are non-marked are prime.

# The Sieve of Eratosthenes uses an extra O(n) memory and its runtime
# complexity is O(n log log n).

def count_primes(n)
  # assume everything is prime
  sieve = [true] * n
  count = 0

  # for every number from 2 to n-1
  (2...n).each do |i|
    if sieve[i] == true
      count += 1
      j = 2

      # for every multiple of i
      while i * j < n
        # mark it as not prime
        sieve[i * j] = false

        # so we can skip it next time
        j += 1
      end
    end

    i += 1
  end

  count
end

puts(count_primes(10))
# Output: 4

puts(count_primes(3))
# Output: 1

puts(count_primes(2))
# Output: 1

puts(count_primes(4))
# Output: 1

#
# Approach 3: Using Prime library
#

require 'prime'

def count_primes(n)
  Prime.each(n - 1).count
end

puts(count_primes(10))
# Output: 4

puts(count_primes(3))
# Output: 1

puts(count_primes(2))
# Output: 1

puts(count_primes(4))
# Output: 1
