class SalesLineItemDiscount < ApplicationRecord
  belongs_to :sales_line_item
  belongs_to :product
  monetize :amount_cents

  def self.total
    Money.new(sum(&:amount)).amount
  end
end
