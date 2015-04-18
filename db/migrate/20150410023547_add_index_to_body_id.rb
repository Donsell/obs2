class AddIndexToBodyId < ActiveRecord::Migration
  def change
  	add_index :bodies, :body_id
  end
end
