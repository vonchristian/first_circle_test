module Checkout
  class ApplyDiscount
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
      apply_discounts
    end

    private

    def apply_discounts
      apply_freebie_discounts
      apply_x_for_y_discounts
      apply_bulk_discounts
    end

    def apply_freebie_discounts
      Checkout::Discounts::ApplyFreebie.process(cart: cart, product: product)
    end

    def apply_x_for_y_discounts
      Checkout::Discounts::ApplyXForYDiscount.process(cart: cart, product: product)
    end

    def apply_bulk_discounts
      Checkout::Discounts::ApplyBulkDiscount.process(cart: cart, product: product)
    end
  end
end
