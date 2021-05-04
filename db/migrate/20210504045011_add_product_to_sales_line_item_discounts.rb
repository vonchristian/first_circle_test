class AddProductToSalesLineItemDiscounts < ActiveRecord::Migration[6.1]
  def change
    add_reference :sales_line_item_discounts, :product, null: false, foreign_key: true
  end
end
