def bubble_sort array
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
end
bubble_sort([4,3,78,2,0,2])