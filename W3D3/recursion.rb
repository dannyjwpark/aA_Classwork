require "byebug"

# range
def range_itr(start, last)
    (start...last).map do |num|
        if last < start
            return []
        else
            num
        end
    end
end

p range_itr(3, 9)
p range_itr(6, 10)
p range_itr(8, 3)

def range_rec(start, last)
    return [] if last < start
    return [last - 1] if last == start + 1

    # adding results to the array
    [start] + range_rec(start + 1, last)
end

p range_rec(3, 9)
p range_rec(6, 10)
p range_rec(8, 3)

puts '--------------------------------------------------------'

# Exponentiation

def exponentiation_1(num, power)
    return 1 if power == 0
    return num if power == 1

    # num multiply by function(num, power - 1)
    num * exponentiation_1(num, power - 1)
end

# function(2,3)
# 2*function(2,2)
# 2*2*function(2,1)
# Since power==1, return num
# 2*2*2
# ==8
p exponentiation_1(2, 3) # => 8
p exponentiation_1(3, 3) # => 27

def exponentiation_2(num, power)
    return 1 if power == 0
    return num if power == 1

    expo_even =  exponentiation_2(num, (power/2))
    expo_odd = exponentiation_2(num, ((power - 1) /2))
    if power.even?
        expo_even * expo_even
    else
        num * (expo_odd * expo_odd)
    end

end

p exponentiation_2(2, 3) # => 8
p exponentiation_2(3, 3) # => 27

puts '--------------------------------------------------------'

# def dup(arrays)
#     output = []
#     # return the array if it is not nested
#     # return array if array[0].class != Array
#     return output if array.empty?
        
#     # push the array without the first array + the original array
#     shifted = array.shift
#     output << array.shift + dup(array)
#     # arrays.each do |array|
#     #         output << dup
#     # end

#     # arrays.each do |array|
#     #     output << array
#     # end
#     # output
#     output
# end


def dup(arrays)
    output = [arrays[0]]

    return output if arrays[1] == nil
    # debugger
    arrays.shift
    output + dup(arrays)    
    # ["a"]
    # ["a"] << "a" << dup([["b","c"], [["d","e"]], [[["f"]]]]])

    # ["a"] << "a" << ["b","c"] << dup([[["d","e"]], [[["f"]]]]])

    # ["a"] << "a" << ["b","c"] << << [["d","e"]] << dup([[[["f"]]]]])
    
    # ["a"] << "a" << ["b","c"] << << [["d","e"]] << [[["f"]]]] << dup([])
end

p dup([ "a" , ["b","c"], [["d","e"]], [[["f"]]]] )
# p dup( ["b" , [["d"]] ])

# arr = [ "a" , ["b","c"], [["d","e"]], [[["f"]]]]

# output = []
# p output << arr.shift
# p arr
# puts
# p output << arr.shift
# p arr
# puts
# p output << arr.shift
# p arr
# puts
# p output << arr.shift
# p arr
# puts
# p output << arr.shift
# p arr
# p output << arr.shift
# p arr


p dup(["a", "b", ["c", "d", "e"], [["e", "f"]], [[["g"]]]])
#=> ["a", "b", ["c", "d", "e"], [["e", "f"]], [[["g"]]]]
p dup(['a','b','c']) #=> ['a','b','c']
p dup([])   #=> []
puts '--------------------------------------------------------'
def Fibonacci_iter(n)
    if n==1
        output = [0] 
    elsif n==2
        output = [0,1] 
    else
        output = [0,1]
    end
    
    (3..n).each do |i|
        output << output[-2] + output[-1]
    end
    output
end
puts 'iterative'
p Fibonacci_iter(5)
p Fibonacci_iter(10)
puts


def Fibonacci_rec(n)
    
    # base case
    return [0] if n==1
    return [0,1] if n==2

    # input: n=10
    # output: [0,1,1,2,3,5,8,13,21,34]
    output = Fibonacci_rec(n-1)
            # output = fib(5-1)  << 1+2
            # output = fib(4-1)  << 1+1
            # output = fib(3-1)  << 0+1
            # output = fib(2-1)  << 0
    
    
    output << output[-2] + output[-1]
    # output = Fibonacci_rec(n-2) + Fibonacci_rec(n-1)

    # [0,1,1,2,3]
    # fib(5) = [0,1,1,2] << 3
    # fib(4) = [0,1,1] << 2
    # fib(3) = [0,1] << 1
    # fib(2) = [0,1]

    
end

puts 'recursive'
p Fibonacci_rec(5)
p Fibonacci_rec(10)

puts '--------------------------------------------------------'



def bsearch(array, target, extra_idx=0)
    # debugger
    
    # extra_idx = 0
    # p extra_idx

    return nil if array.include?(target) == false
    
    center_idx = array.length/2
    if array[center_idx] == target
        return center_idx + extra_idx
    end

    # if array.length.odd?
    #     left_side = array[0...center_idx]
    #     right_side = array[center_idx+1..-1]
    # else 
        left_side = array[0...center_idx]
        right_side = array[center_idx+1..-1]
    # end

    if array[center_idx] < target
        extra_idx += (array.length - right_side.length)
        bsearch(right_side, target, extra_idx)
        # p "right side! #{right_side}"
    elsif array[center_idx] > target
        bsearch(left_side, target, extra_idx)
        # p "left side! #{left_side}"
    end

end

puts 'BINARY SEARCH:'
p bsearch([1, 2, 3, 4, 5, 6, 7, 8, 9],4)                #3
puts
p bsearch([1, 2, 3, 4, 5, 6, 7, 8, 9,10,11,12,13],9)    #8
puts
p bsearch([1, 2, 3, 4, 5, 6, 7, 8, 9,10,11,12,13],11)   #10
puts
p bsearch([1,3,4,8,12,17],4)        #2
puts
p bsearch([1,3,4,8,12,17],5)        #nil


# p Array.bsearch([1, 2, 3, 4, 5, 6, 7, 8, 9],4)


# [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]  idx of 11 : 10
                                                # extra += 7
#                      [8, 9, 10, 11, 12, 13]  idx of 11 : 3
                                                #  extra +=3
#                                [11, 12, 13]   idx of 11 : 0
                                                #  extra +=0
#                                [11]            idx of 11 : 0


                        
puts '--------------------------------------------------------'

#Merge Sort

def merge_sort (arr)

    return arr if arr = arr.sort
    return arr if arr.length == 0
    return arr if arr.length == 1

    center_idx = arr.length/2
    arr_lower = arr[0...center_idx].sort
    arr_higher = arr[center_idx..-1].sort

    merge_sort(arr_lower) + merge_sort(arr_higher)

end

p merge_sort([1,10,7,9,3,6])
p merge_sort([38,27,43,3,9,82,10])

puts '--------------------------------------------------------'

# Array_subsets

def subsets(arr)
    
    return if 

    n_perm = factorial(arr.length)



end

def factorial(num)
    return num if num == 1

    num * factorial(num-1)
end

def fact_combinations(length)
    output = []

    count = 0
    while count<length
        (1..length).each_with_index do |ele,i|
            if count == 0
                output.push(i)
            elsif i+count <=length
                output.push((i..i+count).to_a)
            end
            count +=1
        end
    end

    output
end

p subsets([1,2,3])
p subsets([2,4,6,8,10])

p fact_combinations(4)
