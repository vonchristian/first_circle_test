module DiscountRules
  class BulkDiscount < ApplicationRecord
    belongs_to :product
    monetize :discount_price_cents

    validates :discount_price_cents, presence: true, numericality: true

    def self.enabled
      where(enabled: true)
    end

    def discounted_price(amount)
      amount.to_f - Money.new(discount_price).amount
    end
  end
end
