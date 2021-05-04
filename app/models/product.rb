class Product < ApplicationRecord
  belongs_to :storefront
  has_many :freebies,          class_name: "DiscountRules::Freebie", foreign_key: 'product_id'
  has_many :bulk_discounts,    class_name: "DiscountRules::BulkDiscount"
  has_many :x_for_y_discounts, class_name: "DiscountRules::XForYDiscount"
  has_many :pricings

  def latest_price
    return 0 if pricings.blank?

    Money.new(pricings.latest.try(:amount)).amount
  end
end
