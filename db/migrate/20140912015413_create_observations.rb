class CreateObservations < ActiveRecord::Migration
  def change
    create_table :observations do |t|
      t.integer :user_id
      t.integer :sesssion_id
      t.integer :body_id
      t.date :obs_date
      t.time :obs_time
      t.integer :seeing
      t.integer :transparency
      t.integer :telescope_id
      t.integer :eyepiece_id
      t.integer :filter_id
      t.text :note

      t.timestamps
    end
  end
end
