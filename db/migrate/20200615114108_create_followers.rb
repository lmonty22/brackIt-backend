class CreateFollowers < ActiveRecord::Migration[6.0]
  def change
    create_table :followers do |t|
      t.integer :tournament_followed_id
      t.integer :user_follower_id

      t.timestamps
    end
  end
end
