require 'rails_helper'

module Checkout
  module Discounts
    describe ApplyXForYDiscount, type: :service do

      #sample: the brand new Super iPad will have a bulk discount applied, where the price will drop to $499.99 each, if someone buys more than 4

      it ".process(args={})" do
        cart             = create(:cart)
        product          = create(:product, sku: 'atv', name: "Apple TV")
        pricing          = create(:pricing, product: product, amount: 109.50)
        x_for_y_discount = create(:x_for_y_discount, product: product, name: "3 for 2 deal on Apple TV", purchase_quantity: 3, discounted_quantity: 1, enabled: true)

        cart.scan('atv')
        cart.scan('atv')
        cart.scan('atv')

        described_class.process(cart: cart, product: product)


        discount1 = cart.cart_discounts.first

        expect((Money.new(discount1.amount)).amount).to eq 109.50

      end
    end
  end
end
