class CreateXForYDiscounts < ActiveRecord::Migration[6.1]
  def change
    create_table :x_for_y_discounts do |t|
      t.string :name
      t.belongs_to :product, null: false, foreign_key: true
      t.decimal :purchase_quantity
      t.decimal :discounted_quantity
      t.boolean :enabled, default: false

      t.timestamps
    end
    add_index :x_for_y_discounts, :enabled
  end
end
