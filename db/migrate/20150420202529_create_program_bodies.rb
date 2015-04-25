class CreateProgramBodies < ActiveRecord::Migration
  def change
    create_table :program_bodies do |t|
      t.integer :program_id
      t.integer :body_id

      t.timestamps
    end
  end
end
