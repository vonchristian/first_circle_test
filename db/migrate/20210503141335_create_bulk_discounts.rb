class CreateBulkDiscounts < ActiveRecord::Migration[6.1]
  def change
    create_table :bulk_discounts do |t|
      t.belongs_to :product, foreign_key: true, null: false
      t.decimal :min_purchase_quantity
      t.integer :discount_price_cents, limit: 8, null: false, default: 0
      t.boolean :enabled, default: false

      t.timestamps
    end
    add_index :bulk_discounts, :enabled
  end
end
