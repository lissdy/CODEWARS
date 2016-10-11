#My solution
def generateHashtag(str)
  result = "#"+str.split.map{|word| word[0].upcase+word[1..-1]}.join
  return false if result.length>140||str.length<=1
  result
end



#Best Practise
def generateHashtag(str)
  str = "#" << str.split.map(&:capitalize).join
  str.size <= 140 && str.size > 1 ? str : false
end

def generateHashtag(str)
  return false  if str.empty? || str.length > 140
  "#" + str.gsub(/\w+/, &:capitalize).gsub(/\s+/, '')
end
