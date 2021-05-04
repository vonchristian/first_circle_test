module Checkout
  module Discounts
    class ApplyFreebie
      attr_reader :cart, :product
      def self.process(args={})
        obj = new(args)
        obj.run
      end

      def initialize(args={})
        @cart     = args.fetch(:cart)
        @product  = args.fetch(:product)
      end

      def run
        ApplicationRecord.transaction do
          create_cart_freebies
        end
      end

      def create_cart_freebies
        product.freebies.each do |freebie|
          line_item = cart.sales_line_items.create!(
            product:    freebie.freebie_product,
            unit_cost:  freebie.freebie_product.latest_price,
            total_cost: freebie.freebie_product.latest_price * freebie.quantity,
            quantity:   freebie.quantity
          )

          line_item.sales_line_item_discounts.create!(
            name:    "Discount for #{freebie.freebie_product.name}",
            product: freebie.freebie_product,
            amount:  freebie.freebie_product.latest_price
          )
        end
      end
    end
  end
end
