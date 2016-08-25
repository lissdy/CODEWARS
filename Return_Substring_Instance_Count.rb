#https://www.codewars.com/kata/return-substring-instance-count-2/solutions?show-solutions=1


#MY SOLUTION
def search_substr( fullText, searchText, allowOverlap = true )
	return 0 if searchText==nil
	if allowOverlap
		count =(fullText.size - fullText.gsub(/#{searchText}/,"").size)/searchText.size
	else
	   count = 1 if fullText.include?(searchText)
	end	
	count
end

# search_substr('aa_bb_cc_dd_bb_e', 'bb') # should return 2 since bb shows up twice
# search_substr('aaabbbcccc', 'bbb') # should return 1
p search_substr( 'aaa', 'aa' ) # should return 2  !not work
# search_substr( 'aaa', '' ) # should return 0
# search_substr( 'aaa', 'aa', false ) # should return 1



# describe "Solution" do
#   it "should test for something" do
#     Test.assert_equals(search_substr("aa_bb_cc_dd_bb_e","bb"), 2, "This is just an example of how you can write your own TDD tests")
#   end
# end

#BEST PRACTICE
def search_substr( fullText, searchText, allowOverlap = true )
  if searchText == ''
    0
  else
    fullText.scan(allowOverlap ? Regexp.new("(?=(#{searchText}))") : searchText).size
  end
end

def search_substr( fullText, searchText, allowOverlap = true )
  searchText.empty? || fullText.empty?  ? 0 : fullText.scan(/#{searchText}#{'?' if allowOverlap}/).size
end

def search_substr( fullText, searchText, allowOverlap = true )
  return 0 if searchText.empty?
  fullText.scan(allowOverlap ? /(?=#{searchText})/ : searchText).length
end