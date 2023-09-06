
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

# p binary_search([1, 2, 3], 1) # => 0
# p binary_search([2, 3, 4, 5], 3) # => 1
# p binary_search([2, 4, 6, 8, 10], 6) # => 2
# p binary_search([1, 3, 4, 5, 9], 5) # => 3
# p binary_search([1, 2, 3, 4, 5, 6], 6) # => 5
# p binary_search([1, 2, 3, 4, 5, 6], 0) # => nil
# p binary_search([1, 2, 3, 4, 5, 7], 6) # => nil

# [1, 3, 4, 5, 9], 5
# [1, 3] 4 [5, 9]  # searching idx 2

class Array
    def merge_sort
        return [] if self.length == 0 
        return self if self.length == 1

        middle_index = (self.length - 1) / 2

        arr1 = self[0..middle_index].merge_sort 
        arr2 = self[middle_index + 1..-1].merge_sort 
        merge(arr1, arr2)

        

    end 

end 
    def merge(arr1, arr2)
            new_array = []
            arr1.each do |num1|
                arr2.each do |num2|
                    if num1 < num2
                        new_array << num1
                        break
                    else 
                        new_array << num2
                        
                    end 
                end 
            end 
        new_array
    end 




    test_arr =  [1, 5, 8, 2, 9, 4, 8, 7, 9]
    # p test_arr.merge
    
    
    test1 = [1, 2, 3, 4]
    test2 = [3, 4, 5, 6]
    
    p merge(test1, test2)
    

