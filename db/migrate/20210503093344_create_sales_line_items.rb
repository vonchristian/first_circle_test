class CreateSalesLineItems < ActiveRecord::Migration[6.1]
  def change
    create_table :sales_line_items do |t|
      t.integer :quantity
      t.belongs_to :product,  null: false, foreign_key: true
      t.integer :total_cost_cents, limit: 8, null: false, default: 0
      t.integer :unit_cost_cents,  limit: 8, null: false, default: 0

      t.belongs_to :cart, foreign_key: true

      t.timestamps
    end
  end
end
