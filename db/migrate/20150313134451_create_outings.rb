class CreateOutings < ActiveRecord::Migration
  def change
    create_table :outings do |t|
      t.integer :user_id
      t.date :outing_date
      t.time :outing_time
      t.integer :site_id
      t.integer :seeing
      t.integer :limiting_magnatude
      t.integer :transparancy
      t.text :description

      t.timestamps
    end
  end
end
