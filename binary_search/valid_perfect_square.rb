# Given a positive integer num, write a function which returns True
# if num is a perfect square else False.
#
# Follow up: Do not use any built-in library function such as sqrt.

def is_perfect_square(num)
  if num < 2
    return true
  end

  left = 2
  right = num

  while left <= right
    x = left + (right - left)
    guess_squared = x * x
    if guess_squared == num
      return true
    end
    if guess_squared > num
      right = x - 1
    else
      left = x + 1
    end
  end

  return false
end

num = 16
puts(is_perfect_square(num))
# => true

num = 14
puts(is_perfect_square(num))
# => false
