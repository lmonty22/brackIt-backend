class CreateRounds < ActiveRecord::Migration[6.0]
  def change
    create_table :rounds do |t|
      t.integer :tournament_id
      t.integer :round_number

      t.timestamps
    end
  end
end
