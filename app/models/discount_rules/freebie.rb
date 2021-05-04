module DiscountRules
  class Freebie < ApplicationRecord
    belongs_to :product
    belongs_to :freebie_product, class_name: "Product"

    delegate :latest_price, to: :product, prefix: true
  end
end
