# Given two string arrays word1 and word2, return true if the two arrays represent the same string, and false otherwise.
# A string is represented by an array if the array elements concatenated in order forms the string.

# runs in O(n)
def array_strings_are_equal(word1, word2)
  word1.join == word2.join
end

a = ["abc", "d", "defg"]
b = ["abcddefg"]

puts(array_strings_are_equal(a, b))

word1 = ["a", "cb"]
word2 = ["ab", "c"]
puts(array_strings_are_equal(word1, word2))

word1 = ["a", "ab"]
word2 = ["a", "ab"]
puts(array_strings_are_equal(word1, word2))
