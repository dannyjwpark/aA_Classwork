# Validate Subsequence

# Given two non-empty arrays of integers, write a function that determines whether the second array is a subsequence of the first one.

# A subsequence of an array is a set of numbers that aren't necessarily adjacent but that are in the same order as they appear in the array. 
# For instance, the numbers [1,3,4] form a subsequence of the array [1, 2, 3, 4], and so fo the numbers [2, 4]. 
# Note that a single number in an array and the array itself are both valid sub sequences of the array.


# def validate_subsequence(arr,seq)
#     new_hash = Hash.new(0)
#     arr.each do |ele|
#         new_hash[ele]+=1    #{5:1,1:1,22:1,......, 10:1}
#     end

#     seq.each do |ele|
#         return false if new_hash[ele]==nil    # passes all 
#     end
    
#     true
# end

def validate_subsequence(arr,seq)
    new_hash = Hash.new(0)
    seq.each do |ele|
        new_hash[ele]+=1    #{1:1,6:1,-1:1, 10:1}
    end
    
    arr.each do |ele|
        new_hash[ele]-=1 if new_hash[ele]>0
    end

    return true if new_hash.values.all?(0)
    return false
end

# Sample Input:
array= [5, 1, 22, 25, 6, -1, 8, 10]
Sequence = [1, 6, -1, 10]

# Sample Output:
# True
# p validate_subsequence(array,Sequence)  #true


# ----------------------------
# Given the root of a binary tree, return its maximum depth.

# A binary tree's maximum depth is the number of nodes along the longest path 
# from the root node down to the farthest leaf node.


def maximum_depth(arr)
    # output = []
    depth = 0
    until arr.empty?
        iter = 2**depth
        iter.times{arr.pop}
        depth+=1
    end

    return depth
end

# root = [3,9,20,null,null,15,7]
# Output: 3

root = [1,null,2]
# Output: 2

# Input: root = []
# Output: 0

# Input: root = [0]
# Output: 1

p maximum_depth(root)