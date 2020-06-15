class AddTeamAScoreAndTeamBScoreToMatchUps < ActiveRecord::Migration[6.0]
  def change
    add_column :match_ups, :team_a_score, :integer, default: nil
    add_column :match_ups, :team_b_score, :integer, default: nil
  end
end
