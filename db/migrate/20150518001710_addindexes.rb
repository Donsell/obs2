class Addindexes < ActiveRecord::Migration
  def change
  	add_index :catalogs, :body_id
  	add_index :observations, :outing_id
  	add_index :observations, :body_id
  	add_index :observations, :user_id
  	add_index :outings, :user_id
  	add_index :program_bodies, :body_id
  	add_index :program_observations, :user_id
  	add_index :sites, :user_id
  	add_index :telescopes, :user_id
  	add_index :eyepieces, :user_id
  	add_index :filters, :user_id 
  end
end
