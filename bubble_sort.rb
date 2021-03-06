def bubble_sort array
	start = Time.now
	passes = 1
	not_sorted = true
	while not_sorted
		not_sorted = false
		i=0
		while i<array.length-passes
			if array[i]>array[i+1]
				larger = array[i]
				smaller = array[i+1]
				array[i] = smaller
				array[i+1] = larger
				not_sorted = true
			end
			i+=1
		end
		passes+=1
	end
	print array
	finish = Time.now
	puts "Process took #{finish-start} seconds"
end

def bubble_sort_by array
	passes = 1
	not_sorted = true
	while not_sorted
		not_sorted = false
		i=0
		while i<array.length-passes
			value = yield array[i], array[i+1]
			if value > 0
				larger = array[i]
				smaller = array[i+1]
				array[i] = smaller
				array[i+1] = larger
				not_sorted = true
			end
			i+=1
		end
		passes+=1
	end
	print array
end