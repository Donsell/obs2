class CreateLocationTypes < ActiveRecord::Migration
  def change
    create_table :location_types do |t|
      t.text :name
      t.text :description

      t.timestamps
    end
  end
end
