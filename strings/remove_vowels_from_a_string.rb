# Given a string s, remove the vowels 'a', 'e', 'i', 'o', and 'u'
# from it, and return the new string.

# Example 1:
#
# Input: s = "leetcodeisacommunityforcoders"
# Output: "ltcdscmmntyfrcdrs"

# Example 2:
#
# Input: s = "aeiou"
# Output: ""

# @param {String} s
# @return {String}
def remove_vowels(s)
  consonants = []
  vowels = %w[a e i o u]

  s.to_s.chars.each do |character|
    consonants.push(character) unless vowels.include? character
  end

  consonants.join
end

s = 'leetcodeisacommunityforcoders'
print(remove_vowels(s))
# Output: "ltcdscmmntyfrcdrs"

s = 'aeiou'
print(remove_vowels(s))
# Output: ""
