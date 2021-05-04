class AddStorefrontToProducts < ActiveRecord::Migration[6.1]
  def change
    add_reference :products, :storefront, null: false, foreign_key: true
  end
end
