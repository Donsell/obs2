class CreateCatalogs < ActiveRecord::Migration
  def change
    create_table :catalogs do |t|
      t.string :catalog
      t.string :catalog_num
      t.references :body

      t.timestamps
    end
  end
end
