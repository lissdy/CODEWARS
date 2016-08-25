#https://www.codewars.com/kata/520446778469526ec0000001/solutions/ruby
#Nesting Structure Comparison

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


class Array
  def same_structure_as(other)
    # 把数组全部转换成字符串
    self_str = self.to_s
    other_str = other.to_s
    # 如果参比的other不是数组或者是数组但是长度不同则返回false
    return false if other.class != Array || self.size != other.size
    # 两个括号
     two_brackets = %w([ ])

     # 字符串模式匹配 从0开始到结束
    0.upto(self_str.size-1) do |i|
      # 如果元素是括号
      if two_brackets.include?(self_str[i])
        # 参比元素必须是相同的括号 否则return false
         return false  if self_str[i] != other_str[i]
      else
        # 如果元素不是括号 则判断参比元素不能是括号否则return false
          return false if two_brackets.include?(other_str[i])
      end
    end

    true
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