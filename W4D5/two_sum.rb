# Given an array of unique integers and a target sum, determine whether any two integers 
#     in the array sum to that amount.

# Write a method called bad_two_sum?, which checks every possible pair.

# Make sure that you don't pair an element with itself. 
# However, you don't need to bother checking for summing the same pair twice; that won't 
#   affect your result.

def bad_two_sum(arr)    # O(N^2)
    pair_sums = []
    (0...arr.length).each do |i|            #N
        (i+1...arr.length).each do |j|      #N
            pair_sums << arr[i]+arr[j]      #4  k
        end
    end
    pair_sums                               
end


def brute_force(arr,target)             #O(N^3)
    bad_two_sum(arr).include?(target)   # n^2 * n
end

arr1 = [1,2,3,4,5]
arr2 = [3,5,11,12,16]
p brute_force(arr1, 8)  # true
p brute_force(arr2, 21) #true
p brute_force(arr2, 2)  #false

# time complexity = O(N^3)


####################################

# Sorting
# What does sorting do to the lower bound of your time complexity?
# How might sorting that make the problem easier?

# [1,2,3,4,5,6]
# [1,2,3] [4,5,6]
def okay_two_sum?(arr,target)
    arr.sort!

    return arr if arr.length == 2 && arr.sum == target

    mid = arr.length/2
    left_arr = arr.take(mid)
    right_arr = arr.drop(mid)

    if target <right_arr.sum && target >left_arr.min
        left_arr.okay_two_sum?(left_arr,target)
    elsif left_arr.sum == target
        return left_arr
    elsif right_arr.sum == target
        return right_arr
    elsif target > left_arr.sum && 
        right_arr.okay_two_sum?(right_arr,target)
    end

   
end
arr1 = [3,1,2,5,4]
arr2 = [11,14, 22, 13,32, 25]
p okay_two_sum?(arr1, 8)
p okay_two_sum?(arr2, 33)


#  arr.sort!
#     k=1
#     while k < arr.length-1
#     (0...arr.length).each do |i|
#         if arr[i]+arr[i+k] == target
#             return true
#         elsif arr[i]+arr[i+k] > target
#             break
#         end
#     end
#     k+=1
#     false
    




    # for i in arr.length, k in arr.length-1
    #     if arr[i]+arr[i+k] == target
    #         return true