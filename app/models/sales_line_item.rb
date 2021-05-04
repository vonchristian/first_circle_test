
class SalesLineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart
  has_many :sales_line_item_discounts, dependent: :destroy

  monetize :unit_cost_cents
  monetize :total_cost_cents

  delegate :name, to: :product, prefix: true

  def self.total_discount
    all.map{ |a| a.total_discount }.sum
  end

  def total_discount
    sales_line_item_discounts.total
  end

  def self.total_cost
    total_cost_without_discount.to_f - total_discount.to_f
  end

  def self.total_cost_without_discount
    sum(&:total_cost)
  end
end
