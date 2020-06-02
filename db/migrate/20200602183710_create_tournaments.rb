class CreateTournaments < ActiveRecord::Migration[6.0]
  def change
    create_table :tournaments do |t|
      t.string :name
      t.integer :number_of_teams
      t.integer :champion_id, :default => :null, :null => true

      t.timestamps
    end
  end
end
