module Checkout
  class AddLineItem
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
      add_item
    end

    private
    def add_item
      cart.sales_line_items.create!(
        quantity:   1,
        product:    product,
        unit_cost:  product.latest_price,
        total_cost: product.latest_price
      )
    end
  end
end
