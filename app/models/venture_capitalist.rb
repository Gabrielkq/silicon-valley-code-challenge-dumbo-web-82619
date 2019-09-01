class VentureCapitalist

    attr_reader :name, :total_worth
    @@all =[]

    def initialize (name, total_worth)
        @name = name
        @total_worth = total_worth    
        @@all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        VentureCapitalist.all.select do |vcs|
            vcs.total_worth > 1000000000 
        end
    end
    
    def offer_contract(startup, type, investment)
       FundingRound.new(startup, self, type, investment) 
    end

    def funding_rounds
        FundingRound.all.select {|round| round.venture_capitalist == self}
      
    end

    def portfolio
        portfolio = []
        funding_rounds.select do |vc|
           portfolio << vc.startup

       end
       
       portfolio.uniq
    end

    def biggest_investment
        biggest_investment = 0
        biggest_round = {}
        funding_rounds.each do |vc|
           if vc.investment > biggest_investment
             biggest_investment = vc.investment
            #  binding.pry
             biggest_round = vc
           end
        end
       biggest_round
    end

    def invested(domain_var)
        total = 0
            funding_rounds.select do |round|
            if round.startup.domain == domain_var
                total += round.investment
            end
        end
        total
    end
end
