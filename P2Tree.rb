require_relative './P2Enumerable.rb'

class P2Tree
	include P2Enumerable

	attr_accessor :left, :right, :value

	def initialize(val = nil)
		@value = val
	end

	def add(n)
		if @value == nil
			@value = n
		elsif n < @value
			if @left == nil
				@left = P2Tree.new
			end
			@left.add(n)
		else
			if @right == nil
				@right = P2Tree.new
			end
			@right.add(n)
		end
	end

	def p2each
		if @left != nil
			@left.p2each {|i| yield i}
		end
		if @value != nil
			yield @value
		end
		if @right != nil
			@right.p2each {|i| yield i}
		end
	end


	# def p2each
	# 	if @value != nil
	# 		yield @value
	# 	end
	# 	if @left != nil
	# 		@left.p2each {|i| yield i}
	# 	end
	# 	if @right != nil
	# 		@right.p2each {|i| yield i}
	# 	end
	# end

	def p2each_with_level(level = 0)
		if @left != nil
			@left.p2each_with_level(level + 1) {|i, level| yield i, level}
		end
		if @value != nil
			yield @value, level
		end
		if @right != nil
			@right.p2each_with_level(level + 1) {|i, level| yield i, level}
		end
	end

	# def p2each_with_level(level = 0)
	# 	if @value != nil
	# 		yield @value, level
	# 	end
	# 	if @left != nil
	# 		@left.p2each_with_level(level+=1) {|i, level| yield i, level}
	# 	end
	# 	if @right != nil
	# 		@right.p2each_with_level(level+=1) {|i, level| yield i, level}
	# 	end
	# end
end


				
