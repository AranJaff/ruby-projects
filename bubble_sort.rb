def bubble_sort(array)
    n = array.length()-1
    for i in 0.upto(n-1)
        for j in n.downto(i)
            if array[j] < array[j-1]
                array[j], array[j-1] = array[j-1], array[j]
            end
        end
    end

    p array
end
bubble_sort([2,4,2,5,8,1,-1,0,1,0,-9,7,6])