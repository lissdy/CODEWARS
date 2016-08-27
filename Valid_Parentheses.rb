#https://www.codewars.com/kata/52774a314c2333f0a7000688/train/ruby

#MY SOLUTION
def valid_parentheses(string)
  return true if string.empty?
  left_num = string.size - string.gsub('(','').size
  right_num = string.size - string.gsub(')','').size
  return false if left_num != right_num	
  stack = []
  string.chars.each do |char|
  	if char == "("
  		stack.push("(")
  	elsif char == ")"
  		return false unless stack.pop				
  	end	
  end
  if stack.empty?
  	return true
  else
  	return false
  end
end

#BEST PRACTICE
def valid_parentheses(string)
  open = 0
  string.chars.each do |c|
    open += 1 if c == "("
    open -= 1 if c == ")"
    return false if open < 0
  end
  open == 0
end


def valid_parentheses(string)
  string.chars.each_with_object([]) do |c, stack|
    if c == '('
      stack.push(c)
    elsif c == ')'
      stack.pop or return(false)
    end
  end.empty?
end