class Round < ApplicationRecord
    belongs_to :tournament
    has_many :match_ups
    
    def create_match_ups(teams)
        number_of_match_ups = teams.length/self.round_number/2
        x = 1
        number_of_match_ups.times do 
            mc = MatchUp.create(round_id: self.id, match_up_number: x)
            x += 1
        end
        byebug
    end
   
end
