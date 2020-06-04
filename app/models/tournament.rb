class Tournament < ApplicationRecord
    has_many :rounds 
    belongs_to :champion, class_name: "Team", optional: true
    
    def setChampion(winner_id)
        self.update(champion_id: winner_id)
    end
end
