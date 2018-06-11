def order_weight(strng)
  #initiate hash with arrays
  hash = Hash.new { |h,k| h[k] = [] }
  #arrayify the string into string nums
  array = strng.split(" ")
  #create hash of weights with actual weights
  array.each do |str_num|
    #calculate weight by mapping to individual numbers and adding
    weight = str_num.chars.map(&:to_i).reduce(:+)
    hash[weight] << str_num
  end
  #solution string
  sorted_str = ""
  #map through keys in order
  hash.keys.sort.each do |key|
    val = hash[key].sort
    if val.length > 1
      val.each do |n|
        if sorted_str == ""
          sorted_str = n
        else
          sorted_str += " #{n}"
        end
      end
    else
      n = val[0]
      if sorted_str == ""
        sorted_str = n
      else
        sorted_str += " #{n}"
      end
    end
  end
  sorted_str
end

def primeFactors(n)
  
end
