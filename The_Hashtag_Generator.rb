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

# The marketing team are spending way too much time typing in hashtags.
# Let's help them with out own Hashtag Generator!
#
# Here's the deal:
#
# If the final result is longer than 140 chars it must return false.
# If the input is a empty string it must return false.
# It must start with a hashtag (#).
# All words must have their first letter capitalized.
# Example Input to Output:
#
# " Hello there thanks for trying my Kata" => "#HelloThereThanksForTryingMyKata"
#
# " Hello World " => "#HelloWorld"
