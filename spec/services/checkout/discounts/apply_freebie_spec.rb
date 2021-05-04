require 'rails_helper'

module Checkout
  module Discounts
    describe ApplyFreebie, type: :service do
      it ".process(args={})" do
        cart     = create(:cart)
        product1 = create(:product, sku: 'mbp', name: "Macbook Pro")
        product2 = create(:product, sku: 'avg', name: "AVG Cord")
        pricing1 = create(:pricing, product: product1, amount: 1399.99)
        pricing2 = create(:pricing, product: product2, amount: 30)
        freebie  = create(:freebie, product: product1, freebie_product: product2, enabled: true)

        described_class.process(cart: cart, product: product1)

        freebie_item = cart.sales_line_items.first
        discount     = freebie_item.sales_line_item_discounts.first

        expect(freebie_item.product_id).to eq product2.id
        expect(Money.new(freebie_item.unit_cost).amount).to eql 30
        expect(Money.new(freebie_item.total_cost).amount).to eql 30
        expect(freebie_item.quantity).to eq 1

        expect(discount.name).to eql "Discount for AVG Cord"
        expect(discount.product_id).to eq product2.id
        expect(Money.new(discount.amount).amount).to eq 30
      end
    end
  end
end
