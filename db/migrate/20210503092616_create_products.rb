class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :sku
      t.string :name

      t.timestamps
    end
    add_index :products, :sku, unique: true
  end
end
