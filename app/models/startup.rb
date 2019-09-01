class Startup

    attr_reader :founder, :domain, :venture_capitalist
    attr_accessor :name

       @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    def pivot(domain, name)
        @domain = domain
        @name = name
    end

    def self.all
        @@all
    end

    def self.find_by_founder(founder_var)
        self.all.find do |name|
            name.founder == founder_var
        end
    end

    def self.domains
        self.all.map do |com|
        com.domain
        end
    end
    
    def sign_contract(vc, type, investment)
        FundingRound.new(self, vc, type, investment)
    end
    
    def fundingarr
        FundingRound.all.select do |rounds|
            rounds.startup == self
        end
        
    end


    def num_funding_rounds
        fundingarr.size
    end

  
    def total_funds
        funds = 0
         fundingarr.each do |amount|
                funds += amount.investment
               
        end
        return funds
    end

    def investors
        suvci =
         fundingarr.each do |investor|
            investor.venture_capitalist               
        end
        return suvci.uniq
    end

    def big_investors
            big_shots = []
            # tcc = VentureCapitalist.tres_commas_club
            investors.select do |bigshot|
               if VentureCapitalist.tres_commas_club.include?(bigshot.venture_capitalist) 
                big_shots << bigshot.venture_capitalist
               end
            end
            big_shots.uniq
           
    end

       
    
end
