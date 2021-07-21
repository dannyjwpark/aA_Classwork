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

def dup(arrays)
    output = []
    # return the array if it is not nested
    # return array if array[0].class != Array
    return output if array.empty?
        
    # push the array without the first array + the original array
    shifted = array.shift
    output << array.shift + dup(array)
    # arrays.each do |array|
    #         output << dup
    # end

    # arrays.each do |array|
    #     output << array
    # end
    # output
    output
end


p dup(["a", "b", ["c", "d", "e"], [["e", "f"]], [[["g"]]]])
#=> ["a", "b", ["c", "d", "e"], [["e", "f"]], [[["g"]]]]
p dup(['a','b','c']) #=> ['a','b','c']
p dup([])   #=> []


