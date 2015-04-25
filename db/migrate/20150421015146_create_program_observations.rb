class CreateProgramObservations < ActiveRecord::Migration
  def change
    create_table :program_observations do |t|
      t.integer :user_id
      t.integer :program_id
      t.integer :observation_id

      t.timestamps
    end
  end
end
