# @param {Integer[][]} mat
# @return {Integer[][]}
def diagonal_sort(mat)
  diag_arrays = []

  for i in 0...mat.length
    for j in 0...mat[0].length
      if diag_arrays[mat[0].length+i-j]==nil
        diag_arrays[mat[0].length+i-j]=[mat[i][j]]
      else
        diag_arrays[mat[0].length+i-j]<<mat[i][j]
      end
    end
  end

  diag_arrays[1..-1].map {|arr| arr.sort! }

  for i in 0...mat.length
    for j in 0...mat[0].length
      mat[i][j]=diag_arrays[mat[0].length+i-j].shift
    end
  end

  mat
end

mat = [[3,3,1,1],[2,2,1,2],[1,1,1,2]]
puts diagonal_sort(mat)
# Output: [[1,1,1,1],[1,2,2,2],[1,2,3,3]]

mat = [[11,25,66,1,69,7],[23,55,17,45,15,52],[75,31,36,44,58,8],[22,27,33,25,68,4],[84,28,14,11,5,50]]
puts diagonal_sort(mat)
# Output: [[5,17,4,1,52,7],[11,11,25,45,8,69],[14,23,25,44,58,15],[22,27,31,36,50,66],[84,28,75,33,55,68]]
