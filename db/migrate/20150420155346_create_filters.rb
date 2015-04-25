class CreateFilters < ActiveRecord::Migration
  def change
    create_table :filters do |t|
      t.integer :user_id
      t.text :make
      t.text :model

      t.timestamps
    end
  end
end
