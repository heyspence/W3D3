
def range_rec(start_num, end_num)
    return [] if end_num < start_num 
    new_arr = [start_num]
    new_arr + range_rec(start_num + 1, end_num)
end

def range_itr(start_num, end_num)
end
    

p range_rec(1,5)