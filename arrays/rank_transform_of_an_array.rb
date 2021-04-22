# @param {Integer[]} arr
# @return {Integer[]}
def array_rank_transform(arr)
  hsh = {}

  arr.sort.uniq.each_with_index do |value,index|
     hsh[value] = index
  end

  arr.map{|x| hsh[x] + 1}
end

arr = [40,10,20,30]
puts array_rank_transform(arr)
# Output: [4,1,2,3]

arr = [100,100,100]
puts array_rank_transform(arr)
# Output: [1,1,1]

arr = [37,12,28,9,100,56,80,5,12]
puts array_rank_transform(arr)
# Output: [5,3,4,2,8,6,7,1,3]
