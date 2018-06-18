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
  str = ""
  i = 2
  while n != 1
    counter = 0
    until n % i != 0
      counter += 1
      n = n / i
    end
    if counter == 1
      str += "(#{i})"
    elsif counter > 1
      str += "(#{i}**#{counter})"
    end
    i += 1
  end
  str
end

#rectangle perimeter with sides which are fibonacci lengths
def rectangle(n)
  sum = 0
  i = 1
  i2 = 1
  1.upto(n + 1) do |x|
    sum += i
    i, i2 = i2, i + i2
  end
  sum * 4
end

#add a row to a tree
def add_one_row(root, v, d, level=1)
    return if !root
    if d == 1
        new_root = TreeNode.new(v)
        new_root.left = root
        return new_root
    elsif level == d - 1
        old_r = root.right
        old_l = root.left
        root.right = TreeNode.new(v)
        root.left = TreeNode.new(v)
        root.right.right = old_r
        root.left.left = old_l
    else
        add_one_row(root.left, v, d, level + 1)
        add_one_row(root.right, v, d, level + 1)
    end
    root
end









































#
