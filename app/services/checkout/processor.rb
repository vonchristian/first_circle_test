module Checkout
  class Processor
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
      if product.present?
        ApplicationRecord.transaction do
          add_line_item
          delete_bulk_discounts
          apply_discounts
        end
      end
    end

    private
    def delete_bulk_discounts
      cart.sales_line_items.where(product: product).each do |line_item|
        if line_item.sales_line_item_discounts.present?
          line_item.sales_line_item_discounts.destroy_all
        end
      end
    end

    def add_line_item
      Checkout::AddLineItem.process(cart: cart, product: product)
    end

    def apply_discounts
      Checkout::ApplyDiscount.process(cart: cart, product: product)
    end
  end
end
