class CreateEyepieces < ActiveRecord::Migration
  def change
    create_table :eyepieces do |t|
      t.integer :user_id
      t.string :make
      t.string :model
      t.integer :focal_length
      t.integer :afov

      t.timestamps
    end
  end
end
