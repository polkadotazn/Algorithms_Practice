# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

# @param {TreeNode} root
# @return {Integer}

a
def get_minimum_difference(root)

    return nil if root.nil?
    min = nil

    value = root.val
    current_min = nil

    if root.left
        current_min = (root.val - root.left.val).abs
        right_root = root.left.right
        until right_root.nil?
            current_min = value - right_root.val
            right_root = right_root.right
        end
    end

    min = current_min unless min

    min = current_min if current_min && current_min < min

    if root.right
        current_min = (root.val - root.right.val).abs
        left_root = root.right.left
        until left_root.nil?
            current_min = left_root.val - value
            left_root = left_root.left
        end
    end

    min = current_min unless min

    min = current_min if current_min && current_min < min

    right = get_minimum_difference(root.right)
    left = get_minimum_difference(root.left)

    if right
        min = right if right < min
    end

    if left
        min = left if left < min
    end

    min
end

def is_valid_bst(root)
    return helper(root, nil, nil)
end

def helper(root, min, max)
    return true if root.nil?
    if (min != nil && root.val <= min) || (max != nil && root.val >= max)
        return false
    end
    return helper(root.left, min, root.val) && helper(root.right, root.val, max)
end
