module Checkout
  module Discounts
    class ApplyBulkDiscount
      attr_reader :cart, :product

      def self.process(args={})
        obj = new(args)
        obj.run
      end

      def initialize(args={})
        @cart    = args.fetch(:cart)
        @product = args.fetch(:product)
      end

      def run
        product.bulk_discounts.enabled.each do |discount|
          calculate_discount(cart: cart, discount: discount)
        end
      end

      private

      def calculate_discount(cart:, discount:)
        line_items = cart.sales_line_items.where(product: product)
        count = line_items.size

        if count >= discount.min_purchase_quantity.to_f
          line_items.each do |line_item|
            discounted_price = discount.discounted_price(line_item.unit_cost)

            create_discount(line_item: line_item, discounted_price: discounted_price)
          end
        end
      end

      def create_discount(line_item:, discounted_price:)
        if line_item.sales_line_item_discounts.where(product: product).blank?
          line_item.sales_line_item_discounts.create!(
            name:   "Bulk Discount for #{product.name}",
            product: product,
            amount:  discounted_price
          )
        end
      end
    end
  end
end
