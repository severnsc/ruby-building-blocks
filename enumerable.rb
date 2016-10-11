module Enumerable
	def my_each
		i = 0
		while i < self.length
			yield self[i]
			i+=1
		end
		return self
	end

	def my_each_with_index
		i=0
		while i<self.length
			yield self[i],i
			i+=1
		end
		return self
	end

	def my_select
		results = []
		self.my_each do |a|
			value = yield a
			results << a if value
		end
		return results
	end

	def my_all?
		result = true
		self.my_each do |a|
			if block_given?
				value = yield a
			else
				value = a
			end
			result = false if !value
		end
		return result
	end

	def my_any?
		result = false
		self.my_each do |a|
			if block_given?
				value = yield a
				result = true if value
			else
				result = true if a
			end
		end
		return result
	end

	def my_none?
		result = true
		self.my_each do |a|
			if block_given?
				value = yield a
				result = false if value
			else
				result = false if a
			end
		end
		return result
	end

	def my_count(*args)
		count = 0
		if block_given?
			self.my_each do |a|
				value = yield a
				count+=1 if value
			end
		elsif args[1] != nil
			raise ArgumentError
		elsif args[0] != nil
			self.my_each do |a|
				count+=1 if a == args[0]
			end
		else
			self.my_each {|a| count+=1}
		end
		return count
	end

	def my_map *proc
		new_a = []
		raise ArgumentError if procs.my_count > 1
		if proc.class == Proc
			self.my_each do |a|
				result = proc.call(a)
				new_a << result
			end
		else
			self.my_each do |a|
				result = yield a
				new_a << result
			end
		end
		return new_a
	end

	def my_inject(*args)
		self.is_a?(Range) ? a_self = self.to_a : a_self = self
		total = a_self[0]
		if args.my_count > 2
			raise ArgumentError
		elsif args.my_count == 2
			if !args[0].is_a? Integer
				raise TypeError
			elsif !args[1].is_a? Symbol
				raise TypeError
			else
				total = args[0]
				a_self.my_each {|a| total = total.send(args[1],a)}
			end
		elsif args.my_count == 1
			if args[0].is_a? Integer
				total = args[0]
				a_self.my_each {|a| total=yield total,a}
			elsif args[0].is_a? Symbol
					a_self[1..-1].my_each {|a| total = total.send(args[0],a)}
			else
				raise TypeError
			end	
		else
			a_self[1..-1].my_each do |a| 
				total = yield total, a
			end
		end
		return total
	end

end
def multiply_els array
	product = array.inject {|sum,n| sum*n}
	return product
end
