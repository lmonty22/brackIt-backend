class CreateTournamentFollowers < ActiveRecord::Migration[6.0]
  def change
    create_table :tournament_followers do |t|
      t.integer :follower_id
      t.integer :tournament_followed_id
    end
  end
end
