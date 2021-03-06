# Write a program that outputs the string representation of numbers
# from 1 to n. But for multiples of three it should output “Fizz”
# instead of the number and for the multiples of five output “Buzz”.
# For numbers which are multiples of both three and five output
# “FizzBuzz”.

#
# Approach 1: Naive Approach
#

# Complexity Analysis

# Time Complexity: O(N)
# Space Complexity: O(1)

# @param {Integer} n
# @return {String[]}
def fizz_buzz(n)
  str = []

  n.times do |i|
    i += 1

    if i % 5 == 0 && i % 3 == 0
      str.push("FizzBuzz")
    elsif i % 3 == 0
      str.push("Fizz")
    elsif i % 5 == 0
      str.push("Buzz")
    else
      str.push(i.to_s)
    end
  end

  str
end

n = 15
fizz_buzz(n)
# => [
#     "1",
#     "2",
#     "Fizz",
#     "4",
#     "Buzz",
#     "Fizz",
#     "7",
#     "8",
#     "Fizz",
#     "Buzz",
#     "11",
#     "Fizz",
#     "13",
#     "14",
#     "FizzBuzz"
# ]

#
# Approach 2: String Concatenation
#

# Intuition
#
# This approach won't reduce the asymptotic complexity,
# but proves to be a neater solution when FizzBuzz comes with a twist.
#
# What if FizzBuzz is now FizzBuzzJazz
# i.e. 3 ---> "Fizz" , 5 ---> "Buzz", 7 ---> "Jazz"
#
# If you try to solve this with the previous approach the program would
# have too many conditions to check:
#
# Divisible by 3
# Divisible by 5
# Divisible by 7
# Divisible by 3 and 5
# Divisible by 3 and 7
# Divisible by 7 and 3
# Divisible by 3 and 5 and 7
# Not divisible by 3 or 5 or 7.
#
# This way if the FizzBuzz mappings increase, the conditions would
# grow exponentially in your program.
#
# Algorithm
#
# Instead of checking for every combination of these conditions,
# check for divisibility by given numbers i.e. 3, 5 as given in the
# problem. If the number is divisible, concatenate the corresponding
# string mapping Fizz or Buzz to the current answer string.
#
# For eg. If we are checking for the number 15, the steps would be:
#
# Condition 1: 15 % 3 == 0 , num_ans_str = "Fizz"
# Condition 2: 15 % 5 == 0 , num_ans_str += "Buzz"
# => num_ans_str = "FizzBuzz"
#
# So for FizzBuzz we just check for two conditions instead of three
# conditions as in the first approach.
#
# Similarly, for FizzBuzzJazz now we would just have three
# conditions to check for divisibility.

# Complexity Analysis
#
# Time Complexity: O(N)
# Space Complexity: O(1)

# @param {Integer} n
# @return {String[]}
def fizz_buzz(n)
  str = []

  n.times do |i|
    i += 1
    num_str = ""

    num_str += "Fizz" if i % 3 == 0
    num_str += "Buzz" if i % 5 == 0

    num_str = i.to_s if num_str == ""

    str.push(num_str)
  end

  str
end

n = 15
puts(fizz_buzz(n))

#
# Approach 3: Hash it!
#

# Intuition
#
# This approach is an optimization over approach 2. When the
# number of mappings are limited, approach 2 looks good. But What
# if you decide to add too many mappings?
#
# Having a condition for every mapping is not feasible or may be
# we can say the code might get ugly and tough to maintain.
#
# What if tomorrow we have to change a mapping or maybe delete
# a mapping? Are we going to change the code every time we have a
# modification in the mappings?
#
# We don't have to. We can put all these mappings in a Hash Table.

# Complexity Analysis

# Time Complexity: O(N)
# Space Complexity: O(1)

# @param {Integer} n
# @return {String[]}
def fizz_buzz(n)
  str = []
  fizz_buzz = {}
  fizz_buzz[3] = "Fizz"
  fizz_buzz[5] = "Buzz"

  n.times do |i|
    i += 1
    num_str = ""

    fizz_buzz.each do |key, value|
      num_str += value if i % key == 0
    end

    num_str = i.to_s if num_str == ""

    str.push(num_str)
  end

  str
end

n = 15
puts(fizz_buzz(n))
