class AddPublicToTournaments < ActiveRecord::Migration[6.0]
  def change
    add_column :tournaments, :public, :boolean, default: true
  end
end
