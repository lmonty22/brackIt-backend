class Tournament < ApplicationRecord
    has_many :rounds 
    # has_many :match_ups, through: :rounds
    belongs_to :champion, class_name: "Team", optional: true
    belongs_to :user
    has_many :followers, :foreign_key => "tournament_followed_id"
    has_many :user_followers, through: :followers
    
    def setChampion(winner_id)
        self.update(champion_id: winner_id)
    end

    def create_rounds(teams)
        number_of_rounds = Math.log2(self.number_of_teams)
        # check if number of rounds is a an interget without remainder
        if number_of_rounds % 1 == 0 
            x = 1
            number_of_rounds.to_i.times do 
                r = Round.create(round_number: x, tournament_id: self.id)
                x+= 1 
            end
        end
        self.rounds.each{|r| r.create_match_ups(teams)}
    end


end
