FactoryBot.define do
  factory :storefront do
    name { Faker::Commerce.department }
  end
end
