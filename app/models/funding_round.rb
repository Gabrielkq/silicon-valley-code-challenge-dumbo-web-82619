class FundingRound

 attr_reader :startup, :venture_capitalist, :type, :investment
        @@all = []
    def initialize(startup, venture_capitalist, type, investment)
        @startup = startup
        @venture_capitalist = venture_capitalist
        @type = type
        
        @@all << self
        if investment >= 0 
            @investment = investment.to_f    
        else @investment = 0.to_f
            puts "Step yo game up, son!"
        end
    
    end


    def self.all
        @@all
    end





end
