#https://www.codewars.com/kata/fluent-calculator/solutions?show-solutions=1


##BEST PRACTICE
class Fixnum
  def plus;       Calc.new("+", self) end
  def minus;      Calc.new("-", self) end
  def times;      Calc.new("*", self) end
  def divided_by; Calc.new("/", self) end
end

class Calc
  def initialize(*arguments)
    if arguments.length == 2
      @operation = arguments[0]
      @number    = arguments[1]
    end
  end
  
  %w(zero one two three four five six seven eight nine).each_with_index do |w,i|
    define_method(w) { perform i }
  end
  
  def perform number
    if @operation
      @number.send(@operation, number)
    else
      number
    end
  end
end


##BEST PRACTICE
class Calc
  { zero: 0, one: 1, two: 2, three: 3, four: 4, five: 5, six: 6, seven: 7, eight: 8, nine: 9 }.each do |m, n|
    define_method("#{m}") { @proc ? @proc.call(n) : (@number ||= n ; self ) }
  end
  
  { plus: :+, minus: :-, times: :*, divided_by: :/ }.each do |m, o|
    define_method("#{m}") { @proc ||= lambda { |a| @number.send(o, a) }; self } 
  end
end

##BEST PRACTICE
class Calc
  ACCEPTED_METHODS = { 
    one:'1', two:'2',   three:'3',  four:'4', five:'5',
    six:'6', seven:'7', eight:'8',  nine:'9', ten:'10',
    plus:'+', minus:'-', times:'*', divided_by:'/'
  }
  
  def method_missing(name)
    @calc_string = "#{@calc_string} #{ACCEPTED_METHODS[name]}".strip
    @calc_string.split.size == 3 ? eval(@calc_string) : self
  end
end


# Calc.new.one.plus.two             # Should return 3
# Calc.new.five.minus.six           # Should return -1
# Calc.new.seven.times.two          # Should return 14
# Calc.new.nine.divided_by.three     # Should return 3