require_relative '../amamun_tree/P2Tree.rb'

def test_tree_create
	tree = P2Tree.new(2)
	raise "#{__method__} error" if tree.value != 2
	p "#{__method__} passed"
end

def test_tree_add
	tree = P2Tree.new
	tree.add(2);
	raise "#{__method__} error" if tree.value != 2
	p "#{__method__} passed"
end

def test_tree_p2each
	arr = Array.new
	tree = P2Tree.new(2)
	tree.add(1)

	tree.p2each{|i| arr << i}
	raise "#{__method__} error" if arr != [2,1]
	p "#{__method__} passed"
end

def test_tree_p2each_with_level
	arr = Array.new
	tree = P2Tree.new(2)
	tree.add(3)
	tree.add(4)
	tree.add(5)
	tree.p2each_with_level{|i, l| arr << [i,l]}
	raise "#{__method__} error" if arr != [[2,0], [3,1], [4,2],[5,3]]
	p "#{__method__} passed"
end

test_tree_create
test_tree_add
test_tree_p2each
test_tree_p2each_with_level