class AddCurrentToFilters < ActiveRecord::Migration
  def change
    add_column :filters, :current, :boolean
  end
end
