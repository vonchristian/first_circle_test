class CreatePricings < ActiveRecord::Migration[6.1]
  def change
    create_table :pricings do |t|
      t.belongs_to :product, null: false, foreign_key: true
      t.integer :amount_cents, limit: 8, default: 0, null: false

      t.timestamps
    end
  end
end
