class CartDiscount < ApplicationRecord
  belongs_to :cart
  monetize :amount_cents
  def self.total_cost
    sum(&:amount)
  end
end
