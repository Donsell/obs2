class CreateTelescopes < ActiveRecord::Migration
  def change
    create_table :telescopes do |t|
      t.integer :user_id
      t.string :make
      t.string :model
      t.integer :focal_length
      t.float :f_ratio
      t.integer :diameter

      t.timestamps
    end
  end
end
