FactoryBot.define do
  factory :sales_line_item_discount do
    association :sales_line_item
    association :product
    amount { 100 }
  end
end
