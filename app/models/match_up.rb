class MatchUp < ApplicationRecord
    belongs_to :round
    belongs_to :team_a, class_name: "Team", optional: true
    belongs_to :team_b, class_name: "Team", optional: true


    def findNextLevel
        tournament = self.round.tournament
        number_of_rounds = Math.log2(tournament.number_of_teams)
        if number_of_rounds.to_i == self.round.round_number
            tournament.setChampion(self.winner_id)
        else  
            next_round_number = self.round.round_number+1
            next_round = tournament.rounds.find{|r| r.round_number == next_round_number}
            if self.match_up_number.odd? 
                nr_mc_num = (self.match_up_number + 1)/2
                next_match_up = next_round.match_ups.find{|m| m.match_up_number == nr_mc_num}
                next_match_up.update(team_a_id: self.winner_id)
            else 
                nr_mc_num = self.match_up_number/2
                next_match_up = next_round.match_ups.find{|m| m.match_up_number == nr_mc_num}
                next_match_up.update(team_b_id: self.winner_id)
            end
        end
    end

    def remove_from_matchup(team_slot)
        tournament = self.round.tournament
        last_round = tournament.rounds.find{|r| r.round_number == ((self.round.round_number)-1)}
        if team_slot == 'team_a'
            self.update(team_a_id: nil)
            last_match_up = last_round.match_ups.find{|m| m.match_up_number == ((self.match_up_number * 2) - 1)}
        elsif team_slot == 'team_b'
            self.update(team_b_id: nil)
            last_match_up = last_round.match_ups.find{|m| m.match_up_number == (self.match_up_number * 2)}
        end
        last_match_up.update(winner_id: nil)
    end


end


