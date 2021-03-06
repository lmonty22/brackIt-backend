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
        # check if number of rounds is a an interger without remainder this is here for scalability 
        if number_of_rounds % 1 == 0 
            x = 1
            number_of_rounds.to_i.times do 
                #create each round
                r = Round.create(round_number: x, tournament_id: self.id)
                x+= 1 
            end
        end
        #for each round, create matchups 
        self.rounds.each{|r| r.create_match_ups(teams)}
    end

    def removeLastMatchUpWinner
        round_number= Math.log2(self.number_of_teams).to_i
        last_round = self.rounds.find_by(round_number: round_number)
        last_round.match_ups.first.update(winner_id: nil)
    end


end
