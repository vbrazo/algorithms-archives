# Given an array A of non-negative integers,
# return an array consisting of all the even elements of A,
# followed by all the odd elements of A.
# You may return any answer array that satisfies this condition.

# @param {Integer[]} a
# @return {Integer[]}
def sort_array_by_parity(a)
  pointer1=0
  a.each_with_index do |value, pointer2|
    if value % 2 == 0
     a[pointer1], a[pointer2] = a[pointer2], a[pointer1]
     pointer1 = pointer1 + 1
    end
  end
end

puts(sort_array_by_parity([3,1,2,4]))
# => [2,4,3,1]
