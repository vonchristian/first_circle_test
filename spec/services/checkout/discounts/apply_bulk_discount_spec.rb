require 'rails_helper'

module Checkout
  module Discounts
    describe ApplyBulkDiscount, type: :service do

      #sample: the brand new Super iPad will have a bulk discount applied, where the price will drop to $499.99 each, if someone buys more than 4

      it ".process(args={})" do
        cart          = create(:cart)
        product       = create(:product, sku: 'ipd', name: "Super Ipad")
        pricing       = create(:pricing, product: product, amount: 549.99)
        bulk_discount = create(:bulk_discount, product: product, min_purchase_quantity: 4, discount_price: 499.99, enabled: true)

        cart.scan('ipd')
        cart.scan('ipd')
        cart.scan('ipd')
        cart.scan('ipd')


        described_class.process(cart: cart, product: product)

        item1 = cart.sales_line_items.first
        item2 = cart.sales_line_items.second
        item3 = cart.sales_line_items.third
        item4 = cart.sales_line_items.fourth

        discount1 = item1.sales_line_item_discounts.first
        discount2 = item1.sales_line_item_discounts.first
        discount3 = item1.sales_line_item_discounts.first
        discount4 = item1.sales_line_item_discounts.first

        expect((Money.new(discount1.amount)).amount).to eq 50
        expect((Money.new(discount2.amount)).amount).to eq 50
        expect((Money.new(discount3.amount)).amount).to eq 50
        expect((Money.new(discount4.amount)).amount).to eq 50

      end
    end
  end
end
