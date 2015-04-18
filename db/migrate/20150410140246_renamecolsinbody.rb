class Renamecolsinbody < ActiveRecord::Migration
  def change
    rename_column :bodies, :body_id, :name
    rename_column :bodies ,:alt_id, :alt_name
  end
end
