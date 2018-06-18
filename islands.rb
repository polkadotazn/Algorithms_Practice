def count_islands(matrix)
  count = 0

  matrix.each_with_index do |row, row_idx|
    row.each_with_index do |sq, col_idx|
      if sq == true
          matrix[row_idx][col_idx] = false
          matrix = flip_islands(matrix, row_idx, col_idx)
          count += 1
      end
    end
  end
  count
end

def flip_islands(matrix, r_i, c_i)
  w = matrix[0].length
  h = matrix.length
  [[1,0],[0,1],[-1,0],[0,-1]].each do |coor|
    new_row = coor[0] + r_i
    new_col = coor[1] + c_i
    if new_row < h && new_col < w && new_row >= 0 && new_col >= 0
      if matrix[new_row][new_col] == true
        matrix[new_row][new_col] = false
        matrix = flip_islands(matrix, new_row, new_col)
      end
    end
  end
  matrix
end

m = [[true,true,false,false],[true,false,true,false],[true,false,false,true]]

puts count_islands(m)
