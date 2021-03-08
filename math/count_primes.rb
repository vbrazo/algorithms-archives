#
# Approach 1: Brute Force
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
# Our total runtime has now improved to O(n1.5), which is slightly
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
