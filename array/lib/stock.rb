def stock_picker(arr)
  return [] if arr.length < 2
  max_profit = 0
  max_profit_days = []

  arr.each_with_index do |price, i|
    ((i + 1)...arr.length).each do |j|
      profit = arr[j] - arr[i]
      if profit > max_profit
        max_profit = profit
        max_profit_days = [i,j]
      end
    end
  end


  max_profit_days
end