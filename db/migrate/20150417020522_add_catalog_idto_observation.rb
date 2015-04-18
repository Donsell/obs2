class AddCatalogIdtoObservation < ActiveRecord::Migration
  def change
    add_column  :observations, :catalog_id, :integer
    add_column  :observations, :catalog_name, :text
    add_column  :observations, :catalog_num, :text
  end
end
