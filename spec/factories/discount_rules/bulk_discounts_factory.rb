FactoryBot.define do
  factory :bulk_discount, class: DiscountRules::BulkDiscount do
    association :product
    discount_price { 100 }
  end
end
