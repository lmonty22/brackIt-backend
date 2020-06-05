class Round < ApplicationRecord
    belongs_to :tournament
    has_many :match_ups
    
    def create_match_ups(teams)
        number_of_match_ups = teams.length/self.round_number/2
        x = 1
        (number_of_match_ups.to_i).times do 
            mc = MatchUp.create(round_id: self.id, match_up_number: x)
            x += 1
        end
        teams2 = teams.clone
        if self.round_number == 1  
            self.match_ups.each do |m|
                team_a = teams2.shift
                team_b = teams2.shift
                m.update(team_a_id: team_a.id, team_b_id:team_b.id)
            end
        end
    end
   
end
