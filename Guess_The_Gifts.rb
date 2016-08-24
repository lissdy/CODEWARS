#https://www.codewars.com/kata/52ae6b6623b443d9090002c8/solutions/ruby

#MY SOLUTION
def guess_gifts(wishlist, presents)
  result = []
  presents.each do |present|
  	wishlist.each do |wish|
  	  result << wish[:name]	if wish.values[1..-1] == present.values
  	end	
  end
  result.uniq	
end


#BEST PRACTICE
def guess_gifts(wishlist, presents)
  gifts = []
  presents.uniq.each do |p|
    wishlist.uniq.each do |w|
      gifts << w[:name] if w.merge(p) == w
    end
  end
  gifts
end

def guess_gifts(wishlist, presents)
  wishlist.select { |w| presents.any? { |p| p.all? { |k, v| w[k] == v } } }.map { |x| x[:name] }
end


def guess_gifts(wishlist, presents)
  wishlist.each_with_object([]) do |item, guesses|
    name = item.delete(:name)
    guesses << name if presents.include?(item)
  end
end