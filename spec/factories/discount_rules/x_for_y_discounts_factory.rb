FactoryBot.define do
  factory :x_for_y_discount, class: DiscountRules::XForYDiscount do
    association :product
    name { Faker::Commerce.product_name }
  end
end
