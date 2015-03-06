class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.text :name
      t.float :latitude
      t.float :longitude
      t.text :description

      t.timestamps
    end
  end
end
