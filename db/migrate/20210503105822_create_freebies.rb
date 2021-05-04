class CreateFreebies < ActiveRecord::Migration[6.1]
  def change
    create_table :freebies do |t|
      t.belongs_to :product, null: false, foreign_key: true
      t.belongs_to :freebie_product, null: false, foreign_key: { to_table: :products }
      t.integer :quantity, null: false
      t.boolean :enabled, default: false

      t.timestamps
    end
  end
end

