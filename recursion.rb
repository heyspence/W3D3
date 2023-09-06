
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

    if n.odd?
        b * (exp(b, (n - 1) / 2) ** 2)
    else 
        exp2(b, n / 2) ** 2
    end 

    # last_call_even = exp2(b, n / 2)
    # last_call_odd = exp2(b, (n - 1) / 2)


end 
    
p exp2(2, 3)






    

