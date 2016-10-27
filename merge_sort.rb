def merge_sort(array)
	start = Time.now
	return array if array.length == 1
	if array.length > 1
		new_array = []
		a = merge_sort(array[0..(array.length/2)-1])
		b = merge_sort(array[array.length/2..-1])
		while new_array.length < array.length
			if a[0] == nil
				b.each {|b| new_array.push(b)}
			elsif b[0] == nil
				a.each {|a| new_array.push(a)}
			elsif a[0] == b[0]
				new_array.push(a[0])
				new_array.push(b[0])
				a.shift
				b.shift
			elsif a[0] > b[0]
				new_array.push(b[0])
				b.shift
			elsif a[0] < b[0]
				new_array.push(a[0])
				a.shift				
			end
		end
		finish = Time.now
		puts "Process took #{finish-start} seconds"
		return new_array
	end
end