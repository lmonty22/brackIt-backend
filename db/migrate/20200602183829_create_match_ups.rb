class CreateMatchUps < ActiveRecord::Migration[6.0]
  def change
    create_table :match_ups do |t|
      t.integer :round_id
      t.integer :match_up_number
      t.integer :team_a_id, :default => :null, :null => true
      t.integer :team_b_id, :default => :null, :null => true
      t.integer :winner_id,  :default => :null, :null => true

      t.timestamps
    end
  end
end
