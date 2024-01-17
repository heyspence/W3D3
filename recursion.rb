require "byebug"

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


    def merge(arr1, arr2)
        new_arr = []
        while arr1.length > 0 && arr2.length > 0
            if arr1[0] < arr2[0]
                ele = arr1.shift
                new_arr << ele
            else
                arr1[0] > arr2[0]
                ele = arr2.shift
                new_arr << ele
            end
        end

        if arr1.length == 0
            new_arr + arr2
        else
            arr2.length == 0
            new_arr + arr1
        end
    end
endg


# p [2, 3, 4, 5, 4, 2, 3, 23, 2, 1, 23, 344, 100, 1023871230487, 9213874129387429, 38924497].merge_sort

def subsets(arr)
    return [[]] if arr.length == 0 

    new_arr = []
    
    prev_subset = subsets(arr[0...-1])


        prev_subset.each do |sub_arr|
            
            new_arr << sub_arr + [arr[-1]]
        end 
        prev_subset + new_arr

    
end 

# p subsets([]) # => [[]]
# p subsets([1]) # => [[], [1]]
# p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
p subsets([1, 2, 3])
#=> [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]









# def subsets_itr(arr)
#     new_arr = []
#     arr.each_with_index do |ele, i|
#         sub_array = []
#         arr.each_with_index do |ele2, i2|
#             if !new_arr.include?(sub_arr)
#                 new_arr << sub_arr
#             end 
#             if !sub_arr.include?(ele)
#                 sub_arr << ele

#             if !new_arr.include?(sub_arr)
#                 new_arr << sub_arr
#             end 
#         end 

#     end 

# end 