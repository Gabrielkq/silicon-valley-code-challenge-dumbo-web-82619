require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

su1 = Startup.new("1name", "1founder", "1domain")
su2 = Startup.new("2name", "2founder", "2domain")

vc1 = VentureCapitalist.new("vc1name", 50)
vc2 = VentureCapitalist.new("vc2name", 4000000000000)

fr1 = FundingRound.new(su1, vc2, "type1", -1)
fr1 = FundingRound.new(su1, vc2, "type1", 106)
fr2 = FundingRound.new(su1, vc2, "type2", 1000)
fr3 = FundingRound.new(su1, vc1, "type", 100000000000)
fr4 = FundingRound.new(su2, vc2, "type", 66600000000000)
binding.pry
0 #leave this here to ensure binding.pry isn't the last line