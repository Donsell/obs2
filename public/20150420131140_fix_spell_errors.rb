class FixSpellErrors < ActiveRecord::Migration
  def change
    rename_column :outings, :limiting_magnatude, :limiting_magnitude
    rename_column :outings, :transparancy, :transparency
  end
end
