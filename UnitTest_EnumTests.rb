load '.P2Enumerable.rb'

def test_p2all
	raise "#{__method__} error" unless ((%w[all cat bear]).p2all? { |word| word.length >= 3 })
	raise "#{__method__} error" if (%w[all cat bear].p2all? { |word| word.length >= 4 })
	p "#{__method__} passed"   
end

def test_p2any
	raise "#{__method__} error" unless (%w[all bear cat].p2any? { |word| word.length >= 3 })
	raise "#{__method__} error" unless (%w[all bear cat].p2any? { |word| word.length >= 4 })
	p "#{__method__} passed"   
end

def test_p2collect
	r = [1,2,3].p2collect{ |e| e+1 }
	raise "#{__method__} error" if r != [2,3,4]
	p "#{__method__} passed"
end

def test_p2collect_concat
	p [1, 2, 3, 4].p2collect_concat { |e| [e, -e] }
end

def test_p2count
	a = [1,2,3,4,5,6,7,8,9,10]
	b = a.p2count{|x| x%2==0}
	c = a.p2count{|x| x%3==0}
	d = Hash[1=>2, 2=>5,7=>2,14=>27]
	e = d.p2count{|x,y| y>x}
	raise "#{__method__} error" if b != 5
	raise "#{__method__} error" if c != 3
	raise "#{__method__} error" if e != 3 
	p "#{__method__} passed"
end


def test_p2cycle
	a = ["a","b","c","d"]
	b = Array.new
	a.p2cycle(2) { |x| b << x }
	raise "#{__method__}error" if b.length != 8
	p "#{__method__} passed"   
end

def test_p2detect
	a = [1,2,3,4,70].p2detect { |i| i % 5 == 0 and i % 7 == 0 }
	b = [1,2,3,4,5].p2detect { |i| i % 5 == 0 and i % 7 == 0 }
	raise "#{__method__}error" if a != 70
	raise "#{__method__}error" if b != nil
	p "#{__method__} passed"   
end

def test_p2drop
	a = [1,2,3,4,5,0]
	a = a.p2drop(3)
	raise "#{__method__}error" if a.length != 3
	p "#{__method__} passed"
	
end

def test_p2drop_while
	a = [1,2,3,4,5,0]
	a = a.p2drop_while { |i| i < 3}
	raise "#{__method__} error" if a != [3,4,5,0]
	p "#{__method__} passed"
end

def test_p2each_cons
	b = Array.new
	Array((1..10)).p2each_cons(3) { |a| b<<a }
	raise "#{__method__} error" if b.length != 8
	p "#{__method__} passed"
end

def test_p2each_slice
	b = Array.new
	Array((1..10)).p2each_slice(3) { |a| b<<a }
	raise "#{__method__} error" if b.length != 4
	p "#{__method__} passed"
end

def test_p2each_with_index
	hash = Hash.new
	%w(cat dog wombat).p2each_with_index { |item, index|
		hash[item] = index
	}
	raise "#{__method__} error" if (hash["cat"]!=0 || hash["dog"]!=1 || hash["wombat"]!=2)
	p "#{__method__} passed" 
end

def test_p2entries
	a = (1..7).p2entries
	b = { 'a'=>1, 'b'=>2, 'c'=>3 }.p2entries
	raise "#{__method__} error" if a.length != 7
	raise "#{__method__} error" if b.length != 3
	p "#{__method__} passed"

end

def test_p2find
	a = [1,2,3,4,70].p2find { |i| i % 5 == 0 and i % 7 == 0 }
	b = [1,2,3,4,5].p2find { |i| i % 5 == 0 and i % 7 == 0 }
	raise "#{__method__}error" if a != 70
	raise "#{__method__}error" if b != nil
	p "#{__method__} passed"   
end

def test_p2find_all
	a = Array (1..10)
	b = a.p2find_all { |i|  i % 3 == 0 }
	raise "#{__method__} error" if b.length != 3
	p "#{__method__} passed"   
end

def test_p2find_index
	a = Array((1..10)).p2find_index  { |i| i % 5 == 0 and i % 7 == 0 }
	b = Array((1..100)).p2find_index { |i| i % 5 == 0 and i % 7 == 0 }
	raise "#{__method__} error" if a != nil
	raise "#{__method__} error" if b != 34
	p "#{__method__} passed"
end

def test_p2first
	a = %w[foo bar baz].p2first
	b = %w[foo bar baz].p2first(2)
	c = %w[foo bar baz].p2first(10)
	d = {'a'=>5, 'b'=>4, 'e'=>15, 'c'=>50, 'k'=>7}
	e = d.p2first(3)
	raise "#{__method__} error" if a != "foo"
	raise "#{__method__} error" if b != ["foo", "bar"]
	raise "#{__method__} error" if c != ["foo", "bar", "baz"]
	raise "#{__method__} error" if e != [["a",5], ["b",4], ["e",15]]
	p "#{__method__} passed"
end

def test_p2group_by
	a = Array (1..6)
	b = a.p2group_by{ |i| i%3 }
	raise "#{__method__}error" if (b.values.length != 3 || b.keys.length != 3)
	p "#{__method__} passed"
end	

def test_p2inject
	a = Array((5..10)).p2para0inject {|sum, n| sum+n}
	b = Array((5..10)).p2inject(1) { |product, n| product * n }
	raise "#{__method__} error" if a != 45
	raise "#{__method__} error" if b != 151200
	p "#{__method__} passed"
end

def test_p2minmax
	a = %w(albatross dog horse)
	c = a.p2minmax { |a, b| a.length <=> b.length }
	raise "#{__method__} error" if c != ["dog","albatross"]
	p "#{__method__} passed"
end

def test_p2minmax_by
	b = %w(albatross dog horse)
	d = b.p2minmax{ |x| x.length }
	a = {'a'=>1,'b'=>2,'c'=>3}
	c = a.p2minmax_by{|x| x.length}
	raise "#{__method__} error" if d != ["albatross", "horse"]
	raise "#{__method__} error" if c != [["a",1],["a",1]]
	p "#{__method__} passed"
end

def test_p2partition
	raise "#{__method__} error" if [1,2,3,4,5,6,7,8,9].p2partition{|i| i % 3 == 0} != [[3,6,9], [1,2,4,5,7,8]]
	p "#{__method__} passed"
end

def test_p2reject
	raise "#{__method__} error" if [1,2,3,4,5,6,7,8,9].p2reject{|i| i % 3 == 0} != [1,2,4,5,7,8]
	p "#{__method__} passed"
end

def test_p2take
	a = [1,2,3,4,5]
	b = a.p2take(3)
	c = a.p2take(30)
	d = {'a'=>1, 'b'=>3, 'c'=>17, 'd'=>9 }
	e = d.p2take(2)
	raise "#{__method__} error" if b.length != 3
	raise "#{__method__} error" if c.length != 5
	raise "#{__method__} error" if e.length != 2
	p "#{__method__} passed" 
end

def test_p2take_while
	raise "#{__method__} error" if [1,2,3,4,5,6,7,8,9].p2take_while{|i| i % 3 != 0} != [1,2]
	p "#{__method__} passed"
end

def test_p2to_a
	a = (1..7).p2to_a
	b = { 'a'=>1, 'b'=>2, 'c'=>3}.p2to_a
	raise "#{__method__} error" if a.length != 7
	raise "#{__method__} error" if b.length != 3
	p "#{__method__} passed"
end

def test_p2to_h
	raise "#{__method__} error" if [[1,2],[3,4]].p2to_h != {1=>2, 3=>4}
	p "#{__method__} passed"
end


test_p2all
test_p2any
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
test_p2minmax
test_p2minmax_by
test_p2partition
test_p2reject
test_p2take
test_p2take_while
test_p2to_a
test_p2to_h

