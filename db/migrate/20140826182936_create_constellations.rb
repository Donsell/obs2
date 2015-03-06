class CreateConstellations < ActiveRecord::Migration
  def change
    create_table :constellations do |t|
      t.text :abbr
      t.text :constellation
      t.text :genitive

      t.timestamps
    end
  end
end
