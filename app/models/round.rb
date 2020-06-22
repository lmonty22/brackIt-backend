class Round < ApplicationRecord
    belongs_to :tournament
    has_many :match_ups
    
    
    #create matchups for each round
    def create_match_ups(teams)
        number_of_match_ups = teams.length/(2**self.round_number)
        x = 1
        number_of_match_ups.times do 
            mc = MatchUp.create(round_id: self.id, match_up_number: x)
            x += 1
        end
        teams2 = teams.map{|t| t.id}
        if self.round_number == 1  
            self.match_ups.each do |m|
                team_a = teams2.shift
                team_b = teams2.shift
                m.update(team_a_id: team_a, team_b_id:team_b)
            end
        end
    end
   
end
