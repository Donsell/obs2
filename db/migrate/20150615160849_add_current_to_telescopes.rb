class AddCurrentToTelescopes < ActiveRecord::Migration
  def change
    add_column :telescopes, :current, :boolean
  end
end
