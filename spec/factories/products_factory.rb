FactoryBot.define do
  factory :product do
    association :storefront
    sku { Faker::Commerce.promotion_code }
  end
end
