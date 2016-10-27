def append(ary, n)
	return ary.unshift(0) if n==0
	return append([],n-1).unshift(n)
end

def reverse_append(ary, n)
	return ary << 0 if n==0
	return reverse_append([],n-1) << n
end

def fib(n)
	return 0 if n==0
	return 1 if n==1 || n==2
	return fib(n-1) + fib(n-2)
end

def roman(n)
	roman_mapping = {
  1000 => "M",
  900 => "CM",
  500 => "D",
  400 => "CD",
  100 => "C",
  90 => "XC",
  50 => "L",
  40 => "XL",
  10 => "X",
  9 => "IX",
  5 => "V",
  4 => "IV",
  1 => "I"
}
	number = ""
	if roman_mapping.key?(n)
		number += roman_mapping[n]
	else
		roman_mapping.each do |k,v|
			if n > k
				number += v
				return number += roman(n-k)
			end
		end
	end
	number
end