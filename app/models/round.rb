class Round < ApplicationRecord
    belongs_to :tournament
    has_many :match_ups
    
end
