FactoryBot.define do
  factory :pricing do
    amount_cents { 100 }
    association :product
  end
end
