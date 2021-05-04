class CreateCartDiscounts < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_discounts do |t|
      t.belongs_to :cart, null: false, foreign_key: true
      t.string :name
      t.integer :amount_cents, limit: 8, null: false, default: 0

      t.timestamps
    end
  end
end
