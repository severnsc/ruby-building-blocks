def stock_picker(prices)
	i = 0
	max_profit = 0
	days=[]
	prices.each do |price|
		if price != prices[i..prices.count-1].max
			profit = prices[i..prices.count-1].max - price
			i += 1
		else
			i += 1
		end
		if profit != nil && profit > max_profit
			max_profit = profit
			buy_day = i-1
			sell_day = prices.index(prices[i..prices.count-1].max)
			days = [buy_day,sell_day]
		end
	end
	puts "Buy on day #{days[0]} and sell on day #{days[1]} for a profit of #{max_profit}"
end