class AddCurrentToEyepieces < ActiveRecord::Migration
  def change
    add_column :eyepieces, :current, :boolean
  end
end
