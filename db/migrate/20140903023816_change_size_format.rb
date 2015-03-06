class ChangeSizeFormat < ActiveRecord::Migration
  def change
  	change_column :bodies, :size_max, :text
  	change_column :bodies, :size_min, :text
  end
end
