class MatchUp < ApplicationRecord
    belongs_to :round
    belongs_to :team_a, class_name: "Team", optional: true
    belongs_to :team_b, class_name: "Team", optional: true
end

