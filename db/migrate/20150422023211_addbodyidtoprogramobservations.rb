class Addbodyidtoprogramobservations < ActiveRecord::Migration
  def change
  	add_column :program_observations, :body_id, :integer 
  end
end
