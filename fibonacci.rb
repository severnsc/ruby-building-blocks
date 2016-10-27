def fibs(n)
	numbers = [0,1]
	return numbers[0..n-1] if n < 3
	numbers.push(numbers[-1]+numbers[-2]) while n > numbers.length
	return numbers
end

def fibs_rec(n)
	return [0] if n==1
	return [0, 1] if n==2
	return fibs_rec(n-1).push(fibs_rec(n-1)[-1] + fibs_rec(n-1)[-2])
end