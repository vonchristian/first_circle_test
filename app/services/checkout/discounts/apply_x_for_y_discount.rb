module Checkout
  module Discounts
    class ApplyXForYDiscount
      attr_reader :cart, :product, :line_items

      def self.process(args={})
        obj = new(args)
        obj.run
      end

      def initialize(args={})
        @cart       = args.fetch(:cart)
        @product    = args.fetch(:product)
        @line_items = cart.sales_line_items.where(product: product)
      end

      def run
        product.x_for_y_discounts.enabled.each do |discount|
          apply_discount(cart: cart, discount: discount)
        end
      end

      private

      def apply_discount(cart:, discount:)
        count = line_items.size

        if count == discount.purchase_quantity
          total_cost = line_items.total_cost
          price      = total_cost.to_f / count.to_f

          cart.cart_discounts.create!(
            name: discount.name,
            amount: discount.discounted_quantity * price
          )
        end
      end
    end
  end
end
