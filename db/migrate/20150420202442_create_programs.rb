class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.text :name
      t.text :desc
      t.integer :num_silver
      t.integer :num_gold

      t.timestamps
    end
  end
end
