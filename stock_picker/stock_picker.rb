def stock_picker(array)
  profit_hash = {}

  (0...array.length-1).each do |buy_day|
    (buy_day...array.length).each do |sell_day|
      profit_hash[[buy_day, sell_day]] = array[sell_day] - array[buy_day] 
    end 
  end
  
  profit_hash.key(profit_hash.values.max)
end

p stock_picker([17,3,6,9,15,8,6,1,10])
#=> [1,4]  # for a profit of $15 - $3 == $12