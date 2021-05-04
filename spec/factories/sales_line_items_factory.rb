FactoryBot.define do
  factory :sales_line_item do
    association :product
    association :cart
  end
end
