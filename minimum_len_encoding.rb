def minimum_length_encoding(words)

    hash = Hash.new() {[]}
    words.each do |word|
      hash[word.length] = hash[word.length] << word
    end
    len_arr = hash.keys.sort.reverse

    string = ""
    len_arr.each do |idx|
        hash[idx].each do |word|
            string += word + "#" unless string.match?(/.*(#{word})\W/)
        end
    end
    string.length
end
