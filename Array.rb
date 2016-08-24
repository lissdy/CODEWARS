#https://www.codewars.com/kata/520446778469526ec0000001/solutions/ruby


#MY SOLUTION
class Array
  def same_structure_as(other_array)
     0.upto(self.size - 1).each do |x|
      if self[x].class == Array && other_array[x].class == Array
        return false if self[x].size != other_array[x].size
        self[x].same_structure_as(other_array[x])
      else
         if self[x].class != other_array[x].class
          binding.pry
          return false
        elsif x == (self.size - 1)
          return true
        end 
      end 
    end   
     return true  
  end
end


#BEST PRACTICE

class Array
  def same_structure_as(a)
    return false if self.class!=a.class || size!=a.size 
    a.each_index { |i| return false if self[i].class==Array && !self[i].same_structure_as(a[i]) }
    true
  end
end


class Array
  def structure
    map { |it| it.is_a?(Array) ? it.structure : nil }
  end
  def same_structure_as(arr)
    return false unless arr.is_a?(Array)
    structure == arr.structure
  end
end


class Array
  def same_structure_as(other)
    return unless other.is_a?(Array)
    structurize = -> a { a.map { |i| i.is_a?(Array) ? structurize[i] : :unit } }
    structurize[self] == structurize[other]
  end
end