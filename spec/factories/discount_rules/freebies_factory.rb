FactoryBot.define do
  factory :freebie, class: DiscountRules::Freebie do
    association :product
    association :freebie_product, factory: :product
    quantity { 1 }
  end
end
