class Follower < ApplicationRecord
    belongs_to :tournament_followed, :class_name => "Tournament"
    belongs_to :user_follower, :class_name => "User"
end
