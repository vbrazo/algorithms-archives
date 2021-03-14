# Given an integer n, return true if it is a power of three. Otherwise,
# return false.

# An integer n is a power of three, if there exists an integer x such
# that n == 3^x.

def is_power_of_three(n)
  if (n < 1)
    return false
  end

  while n % 3 == 0
    n /= 3
  end

  n == 1
end

n = 27
is_power_of_three(n)
# Output: true

n = 0
is_power_of_three(n)
# Output: false

n = 9
is_power_of_three(n)
# Output: true

n = 45
is_power_of_three(n)
# Output: false
