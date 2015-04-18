class AddLocationTypeIdToSites < ActiveRecord::Migration
  def change
    add_column :sites, :location_type_id, :integer
  end
end
