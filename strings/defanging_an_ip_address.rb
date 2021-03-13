# Given a valid (IPv4) IP address, return a defanged version of
# that IP address. A defanged IP address replaces every period
# "." with "[.]".

# Example 1:
#
# Input: address = "1.1.1.1"
# Output: "1[.]1[.]1[.]1"

# Example 2:
#
# Input: address = "255.100.50.0"
# Output: "255[.]100[.]50[.]0"

# @param {String} address
# @return {String}
def defang_i_paddr(address)
  hash_table = {}

  address.chars.each_with_index do |value, index|
    if value == "."
      hash_table[index] = "[#{value}]"
    else
      hash_table[index] = value
    end
  end

  hash_table.values.join
end

address = '1.1.1.1'
print(defang_i_paddr(address))
# Output: "1[.]1[.]1[.]1"
