class CreateBodyTypes < ActiveRecord::Migration
  def change
    create_table :body_types do |t|
      t.text :abbr
      t.text :description

      t.timestamps
    end
  end
end
