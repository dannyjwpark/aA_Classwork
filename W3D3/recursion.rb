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

#binary search
# def bsearch(array, target)

#     # base cases
#     return nil if array.include?(target) == false
#     # return ORIGINAL.index(array[0]) if array.length == 1
#     return array.index(array[0]) if array.length == 1

# #recursive steps
#     #step1
#         # array = [1,2,3,4,5,6]   , target = 4 
#     partitioned = array.partition{|num| num < array[array.length/2]}
#         # partitioned = [[1,2,3],[4,5,6]]
#     new_array = partitioned.select {|subarr| subarr.include?(target)}
#         # new_array = [4,5,6]
#     output_array = bsearch(new_array,target)
#     # ORIGINAL.index(output_array)
#     array.index(output_array)

#     #step2
#         # array = [4,5,6]   , target = 4 
#         # partitioned = [[1,2,3],[4,5,6]]
#         # new_array = [4],[5,6]

#     #step3
#         # array = [4]   , target = 4 
#         # array.length == 1   => new_array[0] = 4  => array.index(4) = 3


# end

def bsearch(array, target, extra_idx=0)
    # debugger
    
    # extra_idx = 0
    # p extra_idx

    return nil if array.include?(target) == false
    
    center_idx = array.length/2
    if array[center_idx] == target
        return center_idx + extra_idx
    end

    if array.length.odd?
        left_side = array[0...center_idx]
        right_side = array[center_idx+1..-1]
    else 
        left_side = array[0...center_idx]
        right_side = array[center_idx..-1]
    end

    if array[center_idx] < target
        bsearch(right_side, target, extra_idx)
        extra_idx += (array.length - right_side.length)
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
# p Array.bsearch([1, 2, 3, 4, 5, 6, 7, 8, 9],4)


# [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]  idx of 11 : 10

#                      [8, 9, 10, 11, 12, 13]  idx of 11 : 3

#                                [11, 12, 13]   idx of 11 : 0

                        
