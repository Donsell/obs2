class AddNametoProgramBodies < ActiveRecord::Migration
  def change
    add_column :program_bodies, :name, :string
  end
end
