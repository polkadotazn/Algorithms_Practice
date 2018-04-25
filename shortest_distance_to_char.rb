def shortest_to_char(s, c)
    c_arr = []
    result = []
    s.chars.each_with_index { |let, idx| c_arr << idx if let == c }
    beg_idx = c_arr[0]
    sec_idx = c_arr[1]
    counter = 2
    first_time = true
    s.chars.each_with_index do |let, idx|
        if (idx == beg_idx || idx == sec_idx) && sec_idx
            result << 0
            if first_time
              first_time = false
            else
              beg_idx = sec_idx
              sec_idx = c_arr[counter]
              counter += 1
            end
        elsif sec_idx
            one = (idx - beg_idx).abs
            two = (idx - sec_idx).abs
            result << [one, two].min
        else
            result << (idx - beg_idx).abs
        end
    end
    result
end
