require 'rails_helper'

module Checkout
  describe AddLineItem, type: :service do
    it ".process(args={})" do
      cart    = create(:cart)
      product = create(:product)
      pricing = create(:pricing, amount: 100, product: product)

      expect(cart.sales_line_items.empty?).to eq true

      described_class.process(cart: cart, product: product)

      item = cart.sales_line_items.where(product: product).first

      expect(item.quantity).to eq 1
      expect(item.product_id).to eq product.id
      expect(Money.new(item.unit_cost).amount).to eq 100
      expect(Money.new(item.total_cost).amount).to eq 100
    end
  end
end
