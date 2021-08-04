# Given a string s, find the longest palindromic substring in s. You may assume 
    # that the maximum length of s is 1000.


# each palindromic substring.length >=2
# max length of string = 1000

def longest_palindrome(string)
    substrs = []
    
    (0...string.length).each do |i|
        (i+1...string.length).each do |k|
            substring = string[i..k]
            substrs << substring if is_palindrome?(substring)
        end
    end

    # return the longest palindrome
    substrs.sort[-1]
end

def is_palindrome?(string)
    string == string.reverse
end



# Example 1:

# Input: "babad"
# Output: "bab"
# Note: "aba" is also a valid answer.
# Example 2:
p longest_palindrome("babad")       # bab

# Input: "cbbd"
# Output: "bb"
p longest_palindrome("cbbd")    # bb