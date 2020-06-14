class TournamentFollower < ApplicationRecord
    belongs_to :tournament_followed, :class_name => "Tournament"
    belongs_to :follower, :class_name => "User"


end