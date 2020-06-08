class AddUserIdToTournament < ActiveRecord::Migration[6.0]
  def change
    add_column :tournaments, :user_id, :integer
  end
end
