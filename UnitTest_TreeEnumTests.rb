load '../amamun_tree/P2Tree.rb'
def test_p2each
	tree = P2Tree.new(6)
	tree.add(1)
	tree.add(3)
	tree.add(9)
	arr = []
	tree.p2each { |i| arr << i}
	raise "#{__method__} error" if arr != [1,3,6,9]
	p "#{__method__} passed"
end

def test_p2all?
	tree = P2Tree.new(5)
	tree.add(1)
	tree.add(3)
	tree.add(10)
	raise "#{__method__} error" if tree.p2all? {|i| i%5 == 0} != false
	raise "#{__method__} error" if tree.p2all? {|i| i < 20} != true
	p "#{__method__} passed"
end

def test_p2any?
	tree = P2Tree.new(5)
	tree.add(1)
	tree.add(3)
	tree.add(10)
	raise "#{__method__} error" if tree.p2any? {|i| i%5 == 0} != true
	raise "#{__method__} error" if tree.p2any? {|i| i%11 == 0} != false
	p "#{__method__} passed"
end

def test_p2collect
	tree = P2Tree.new(6)
	tree.add(1)
	tree.add(2)
	tree.add(9)
	raise "#{__method__} error" if tree.p2collect {|i| i*i} != [1,4,36,81]
	p "#{__method__} passed"
end

def test_p2collect_concat
	tree = P2Tree.new(5)
	[1,2,3,4,6,7,8,9,10].p2each{|i| tree.add(i)}
	raise "#{__method__} error" if tree.p2collect_concat { |i| [i,-i]} != [1, -1, 2, -2, 3, -3, 4, -4, 5, -5, 6, -6, 7, -7, 8, -8, 9, -9, 10, -10] 
	p "#{__method__} passed"
end

def test_p2count
	tree = P2Tree.new(5)
	tree.add(1)
	tree.add(3)
	tree.add(10)
	raise "#{__method__} error" if tree.p2count{|i| i < 5} != 2
	p "#{__method__} passed"
end	

def test_p2cycle
	tree = P2Tree.new(5)
	tree.add(1)
	tree.add(6)
	tree.add(9)
	arr = []
	tree.p2cycle(3) {|i| arr << i}
	raise "#{__method__} error" if arr != [1, 5, 6, 9, 1, 5, 6, 9, 1, 5, 6, 9]
	p "#{__method__} passed"
end

def test_p2detect
	arr = []
	tree = P2Tree.new(5)
	tree.add(1)
	tree.add(6)
	tree.add(9)
	raise "#{__method__} error" if tree.p2detect{|i| i%5 == 0} != 5
	p "#{__method__} passed"
end

def test_p2drop
	tree = P2Tree.new(5)
	tree.add(1)
	tree.add(6)
	tree.add(9)
	raise "#{__method__} error" if tree.p2drop(2) != [6, 9]
	p "#{__method__} passed"
end

def test_p2drop_while
	tree = P2Tree.new(5)
	tree.add(1)
	tree.add(3)
	tree.add(10)
	raise "#{__method__} error" if tree.p2drop_while{|i| i % 5 != 0} != [5,10]
	p "#{__method__} passed"
end

def test_p2each_cons
	tree = P2Tree.new(5)
	[1,2,3,4,6,7,8,9,10].p2each{|i| tree.add(i)}
	b = []
	tree.p2each_cons(2){|i| b << i}
	raise"#{__method__} error" if b != [[1, 2], [2, 3], [3, 4], [4, 5], [5, 6], [6, 7], [7, 8], [8, 9], [9, 10]]
	p "#{__method__} passed"
end

def test_p2each_slice
	tree = P2Tree.new(5)
	[1,2,3,4,6,7,8,9,10].p2each{|i| tree.add(i)}
	b = []
	tree.p2each_slice(2){|i| b << i}
	raise"#{__method__} error" if b != [[1, 2], [3, 4], [5, 6], [7, 8], [9, 10]] 
	p "#{__method__} passed"
end

def test_p2each_with_index
	hash = Hash.new
	tree = P2Tree.new(5)
	[1,2,3,4,6,7,8,9,10].p2each{|i| tree.add(i)}
	tree.p2each_with_index{|item, index| hash[item] = index}
	raise "#{__method__} error" if hash != {1=>0, 2=>1, 3=>2, 4=>3, 5=>4, 6=>5, 7=>6, 8=>7, 9=>8, 10=>9} 
	p "#{__method__} passed"
end

def test_p2entries
	tree = P2Tree.new(5)
	[1,2,3,4,6,7,8,9,10].p2each{|i| tree.add(i)}
	raise "#{__method__} error" if tree.p2entries != [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
	p "#{__method__} passed"
end

def test_p2find
	tree = P2Tree.new(5)
	[1,2,3,4,6,7,8,9,10].p2each{|i| tree.add(i)}
	raise "#{__method__} error" if tree.p2find{|i| i % 3 == 0} != 3
	p "#{__method__} passed"
end

def test_p2find_all
	tree = P2Tree.new(5)
	[1,2,3,4,6,7,8,9,10].p2each{|i| tree.add(i)}
	raise "#{__method__} error" if tree.p2find_all{|i| i % 3 == 0} != [3,6,9]
	p "#{__method__} passed"
end

def test_p2find_index
	tree = P2Tree.new(5)
	[1,2,3,4,6,7,8,9,10].p2each{|i| tree.add(i)}
	raise "#{__method__} error" if tree.p2find_index{|i| i % 3 == 0} != 2
	p "#{__method__} passed"
end

def test_p2first
	tree = P2Tree.new(5)
	[1,2,3,4,6,7,8,9,10].p2each{|i| tree.add(i)}
	raise "#{__method__} error" if tree.p2first(3) != [1,2,3]
	p "#{__method__} passed"
end

def test_p2group_by
	tree = P2Tree.new(5)
	[1,2,3,4,6,7,8,9,10].p2each{|i| tree.add(i)}
	raise "#{__method__} error" if tree.p2group_by{|i| i % 3 == 0} != {false=>[1, 2, 4, 5, 7, 8, 10], true=>[3, 6, 9]}
	p "#{__method__} passed"
end

def test_p2inject
	tree = P2Tree.new(5)
	[1,2,3,4,6,7,8,9,10].p2each{|i| tree.add(i)}
	raise "#{__method__} error" if tree.p2inject(2) { |product, n| product * n } != 7257600
	p "#{__method__} passed"
end

def test_p2para0inject
	tree = P2Tree.new(5)
	[1,2,3,4,6,7,8,9,10].p2each{|i| tree.add(i)}
	raise "#{__method__} error" if tree.p2para0inject { |product, n| product * n } != 3628800 
	p "#{__method__} passed"
end

def test_p2para0inject
	tree = P2Tree.new(5)
	[1,2,3,4,6,7,8,9,10].p2each{|i| tree.add(i)}
	raise "#{__method__} error" if tree.p2para0inject { |product, n| product * n } != 3628800 
	p "#{__method__} passed"
end

def test_p2minmax
	tree = P2Tree.new(5)
	[1,2,3,4,6,7,8,9,10].p2each{|i| tree.add(i)}
	raise "#{__method__} error" if tree.p2minmax { |a,b| a <=> b } != [1,10]
	p "#{__method__} passed"
end

def test_p2minmax_by
	tree = P2Tree.new(5)
	[1,2,3,4,6,7,8,9,10].p2each{|i| tree.add(i)}
	raise "#{__method__} error" if tree.p2minmax_by { |a| a } != [1,10]
	p "#{__method__} passed"
end

def test_p2partition
	tree = P2Tree.new(5)
	[1,2,3,4,6,7,8,9,10].p2each{|i| tree.add(i)}
	raise "#{__method__} error" if tree.p2partition { |i| i % 3 == 0} != [[3, 6, 9], [1, 2, 4, 5, 7, 8, 10]]
	p "#{__method__} passed"
end

def test_p2reject
	tree = P2Tree.new(5)
	[1,2,3,4,6,7,8,9,10].p2each{|i| tree.add(i)}
	raise "#{__method__} error" if tree.p2reject { |i| i % 3 == 0} != [1, 2, 4, 5, 7, 8, 10]
	p "#{__method__} passed"
end

def test_p2take_while
	tree = P2Tree.new(5)
	[1,2,3,4,6,7,8,9,10].p2each{|i| tree.add(i)}
	raise "#{__method__} error" if tree.p2take_while { |i| i % 5 != 0} != [1, 2, 3, 4]
	p "#{__method__} passed"
end

def test_p2to_h
	arr = []
	tree = P2Tree.new(5)
	[1,3,5,7,9,11,13,15].p2each{|i| tree.add(i)}
	tree.p2each_with_index{|item, index| arr << [index, item]}
	raise "#{__method__} error" if arr.p2to_h != {0=>1, 1=>3, 2=>5, 3=>5, 4=>7, 5=>9, 6=>11, 7=>13, 8=>15} 
	p "#{__method__} passed"
end


test_p2each
test_p2all?
test_p2any?
test_p2collect
test_p2collect_concat
test_p2count
test_p2cycle
test_p2detect
test_p2drop
test_p2drop_while
test_p2each_cons
test_p2each_slice
test_p2each_with_index
test_p2entries
test_p2find
test_p2find_all
test_p2find_index
test_p2first
test_p2group_by
test_p2inject
test_p2para0inject
test_p2minmax
test_p2minmax_by
test_p2partition
test_p2reject
test_p2take_while
test_p2to_h