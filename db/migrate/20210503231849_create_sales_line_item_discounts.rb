class CreateSalesLineItemDiscounts < ActiveRecord::Migration[6.1]
  def change
    create_table :sales_line_item_discounts do |t|
      t.belongs_to :sales_line_item, null: false, foreign_key: true
      t.integer :amount_cents, limit: 8, null: false, default: 0
      t.string :name

      t.timestamps
    end
  end
end
