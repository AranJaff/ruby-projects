def stock_picker(stock_prices)
    min = stock_prices[0]
    max = stock_prices[0]

    stock_prices.map do |price|
        min = price if price < min
        max = price if price > max
    end
    
    p [min, max]
end

stock_picker([12,3,20,5,8,11,20,17,11])