class AddStatsToUsers < ActiveRecord::Migration
  def change
    remove_column :users, :stat_id
    add_column :users, :obs, :integer
    add_column :users, :sites_obs, :text
    add_column :users, :prog_obs, :text
  end
end
