# Given two string arrays word1 and word2, return true if the two arrays represent the same string, and false otherwise.
# A string is represented by an array if the array elements concatenated in order forms the string.

# runs in O(n)
def array_strings_are_equal(word1, word2)
  word1.join == word2.join
end

a = %w[abc d defg]
b = ["abcddefg"]

puts(array_strings_are_equal(a, b))

word1 = %w[a cb]
word2 = %w[ab c]
puts(array_strings_are_equal(word1, word2))

word1 = %w[a ab]
word2 = %w[a ab]
puts(array_strings_are_equal(word1, word2))
