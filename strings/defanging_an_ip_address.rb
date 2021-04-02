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

#
# Approach 1: Hash map
#

# @param {String} address
# @return {String}
def defang_i_paddr(address)
  hash_table = {}

  address.chars.each_with_index do |value, index|
    hash_table[index] = if value == "."
                          "[#{value}]"
                        else
                          value
                        end
  end

  hash_table.values.join
end

address = "1.1.1.1"
print(defang_i_paddr(address))
# Output: "1[.]1[.]1[.]1"

address = "255.100.50.0"
print(defang_i_paddr(address))
# Output: "255[.]100[.]50[.]0"

#
# Approach 2: Iterative
#

def defang_i_paddr(address)
  defanged_address = ""

  address.each_char do |char|
    char = "[.]" if char == "."

    defanged_address += char
  end

  defanged_address
end

address = "1.1.1.1"
print(defang_i_paddr(address))
# Output: "1[.]1[.]1[.]1"

address = "255.100.50.0"
print(defang_i_paddr(address))
# Output: "255[.]100[.]50[.]0"

#
# Approach 3: Using ruby methods
#

def defang_i_paddr(address)
  address.gsub(".", "[.]")
end

address = "1.1.1.1"
print(defang_i_paddr(address))
# Output: "1[.]1[.]1[.]1"

address = "255.100.50.0"
print(defang_i_paddr(address))
# Output: "255[.]100[.]50[.]0"
