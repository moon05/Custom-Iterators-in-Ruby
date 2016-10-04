class Hash
	def p2each
		index = 0
		a = self.to_a
		while index < a.size
			yield a[index]
			index += 1
		end
	end
end

class Array
	def p2each
		self.size.times do | i |
			yield( self[ i ] )
		end
	end
end


module P2Enumerable

	def p2all?
		p2each do |e|
			var = yield (e)
			if var == false
				return false
			end
		end
		return true
	end

	def p2any?
		p2each do |e|
			var = yield (e)
			if var
				return true
			end
		end
		return false
	end

	def p2collect
		r = Array.new
		p2each do |e|
			res = yield (e)
			r << res
		end
		return r
	end

	def p2collect_concat
		r = Array.new
		p2each do |e|
			r.concat(yield e)
		end
		return r
	end

	def p2count
		counter = 0
		p2each do |e|
			if yield(e)
				counter += 1
			end
		end
		return counter
	end		

	def p2cycle(n)
		if n == nil
			while true
				p2each do |e|
					yield (e)
				end
			end
			return
		end
		n.times do |e|
			p2each do |q| 
				yield (q) 
			end
		end

		if n < 0
			return
		end
	end

	def p2detect(n = nil)

		p2each do |e|
			if yield (e)
				return e
			end
		end
		return n
	end

	def p2drop(n)
		a = n
		r = Array.new
		counter = 0
		self.p2each do |e|
			counter += 1
			if counter > a
				r << e
			end
		end
		return r
	end

	def p2drop_while
		counter = 0
		p2each do |e|
			counter += 1
			if !yield (e)
				counter -= 1
				break
			end
		end
		self.p2drop(counter)
	end

	def p2each_cons(n)
		k = []
		p2each do |e|
			if k.length < n
				k<<e
			else
				yield k
				k = k[1..k.length]
				k<<e
			end
		end
		if k.length == n
			yield k
		end
	end

	def p2each_slice(n)
		holder = 0
		holder_r = Array.new
		p2each do |e|
			if holder == n
				yield holder_r
				holder = 1
				holder_r = Array.new
				holder_r << e
			else
				holder += 1
				holder_r<<e
			end
		end
		if !holder_r.empty?
			yield holder_r
		end
	end

	def p2each_with_index
		counter = 0
		p2each do |e|
			x = counter
			(yield e,x)
			counter += 1
		end
		return
	end

	def p2entries
		a = Array.new
		if self.class == Range
			b = Array (self)
			return b
		end
		p2each do |e|
			a << e
		end
		return a
	end

	alias p2find p2detect

	def p2find_all
		a = Array.new
		p2each do |e|
			b = yield e
			if b
				a << e
			end
		end
		return a
	end

	def p2find_index
		counter = 0
		p2each do |e|
			if yield (e)
				return counter
			else
				counter += 1
			end
		end
		return nil
	end

	def p2first(n = 0)
		a = Array.new
		p2each do |e|
			if n == 0
				if a.empty?
					return e
				else
					return a
				end
			else
				n -= 1
				a << e
			end
		end
		return a
	end

	def p2group_by
		hash = Hash.new
		p2each do |e|
			r = yield e
			if !(hash.keys.include? r)
				hash[r] = []
			end
			hash[r]<< e
		end
		return hash
	end

	def p2inject( init )
		r = init
		p2each do | e |
			r = yield( r, e )
		end
		return r
	end

	def p2para0inject
		f = true
		r = nil
		self.p2each do |e|
			if f
				r = e
				f = false
			else
				r = yield(r, e)
			end
		end
		return r
	end

	def p2minmax
		a = self.p2entries
		min = a[0]
		max = a[0]

		p2each do |e|
			if (yield e,min) < 0
				min = e
			end
			if (yield e,max) > 0
				max = e
			end
		end
		return [min,max]
	end

	def p2minmax_by
		min = self.p2entries[0]
		max = self.p2entries[0]
		p2each do |e|
			r = yield e
			if r < (yield min)
				min = r
			end
			if r > (yield max)
				max = r
			end
		end
		return [min, max]
	end

	def p2partition
		true_arr = Array.new
		false_arr = Array.new
		p2each do |e|
			if yield e
				true_arr << e
			else
				false_arr << e
			end
		end
		return [true_arr, false_arr]
	end

	def p2reject
		false_arr = Array.new
		p2each do |e|
			if !(yield e)
				false_arr << e
			end
		end
		return false_arr
	end

	alias p2take p2first

	def p2take_while
		arr = Array.new
		p2each do |e|
			if !(yield e)
				return arr
			end
			arr << e
		end
		return arr
	end

	alias p2to_a p2entries

	def p2to_h
		hash = Hash.new
		p2each do |e|
			hash[e[0]] = e[1]
		end
		return hash
	end

end





class Array
	include P2Enumerable
end
class Hash
	include P2Enumerable
end
class Range
	include P2Enumerable
end