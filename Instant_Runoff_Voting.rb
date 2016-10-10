def runoff(voters)
  winners = []
  voters.map{|voter| winners << voter[0]}

end


# voters = [[:dem, :ind, :rep],
#           [:rep, :ind, :dem],
#           [:ind, :dem, :rep],
#           [:ind, :rep, :dem]]
#
# Test.assert_equals(runoff(voters), :ind)
