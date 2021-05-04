module DiscountRules
  class XForYDiscount < ApplicationRecord
    belongs_to :product
    validates :name, presence: true

    def self.enabled
      where(enabled: true)
    end
  end
end
