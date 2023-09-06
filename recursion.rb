
def range_rec(start_num, end_num)
    return [] if end_num < start_num 
    new_arr = [start_num]
    new_arr + range_rec(start_num + 1, end_num)
end

# p range_rec(1,5)

def range_itr(start_num, end_num)
    new_array = []
    (start_num..end_num).each do |num|
        new_array << num
    end 
    new_array
end

# p range_itr(1, 5)

def exp1(b, n)
    return 1 if n == 0
    exp1(b, n -1) * b
end 

# p exp1(2, 4)

def exp2(b, n)
    return 1 if n == 0 
    return b if n == 1

    # last_call = exp2(b, n - 1)

    last_call_even = exp2(b, n / 2)
    last_call_odd = exp2(b, (n - 1) / 2)

    if n.odd?
        b * (last_call_odd * last_call_odd)
    else 
        last_call_even * last_call_even
    end
end 
    
class Array
    def deep_dup
        array = []
        
        self.each do |ele|
            if !ele.is_a?(Array)
                array << ele
            else
                array << ele.deep_dup
            end
        end
        array
    end
end


# robot_parts = [
#   ["nuts", "bolts", "washers"],
#   ["capacitors", "resistors", "inductors"]
# ]

# p robot_parts_copy = robot_parts.deep_dup

# # shouldn't modify robot_parts
# p robot_parts_copy[1] << "LEDs"
# # but it does
# p robot_parts[1] # => ["capacitors", "resistors", "inductors", "LEDs"]
    
# test_arr = [1, [2], [3, [4]]]
# p test_arr.deep_dup

def fib(n) 
    return [] if n == 0 
    return [1] if n == 1
    return [1, 1] if n == 2
    last_call = fib(n - 1 )
    last_call << last_call[-1] + last_call[-2] 

end 

# p fib(8)

def binary_search(arr, target)
    middle_idx = (arr.length - 1)/ 2
    return middle_idx if target == arr[middle_idx]
    return nil if arr.length == 0
    
    if target < arr[middle_idx]
        binary_search(arr[0...middle_idx], target)
    else
        right_binary_search = binary_search(arr[middle_idx + 1..-1], target)
        return nil if right_binary_search == nil
        middle_idx + 1 + right_binary_search
    end
end

p binary_search([1, 2, 3], 1) # => 0
p binary_search([2, 3, 4, 5], 3) # => 1
p binary_search([2, 4, 6, 8, 10], 6) # => 2
p binary_search([1, 3, 4, 5, 9], 5) # => 3
p binary_search([1, 2, 3, 4, 5, 6], 6) # => 5
p binary_search([1, 2, 3, 4, 5, 6], 0) # => nil
p binary_search([1, 2, 3, 4, 5, 7], 6) # => nil

# [1, 3, 4, 5, 9], 5
# [1, 3] 4 [5, 9]  # searching idx 2
