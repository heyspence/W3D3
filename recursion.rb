
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

p fib(8)




