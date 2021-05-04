require 'rails_helper'

module DiscountRules
  describe BulkDiscount, type: :model do
    describe 'associations' do
      it { is_expected.to belong_to :product }
    end

    describe 'monetize' do
      it { is_expected.to monetize(:discount_price) }
    end

    describe 'validations' do
      it { is_expected.to validate_presence_of :discount_price_cents }
      it { is_expected.to validate_numericality_of :discount_price_cents }
    end

    it ".enabled" do
      enabled  = create(:bulk_discount, enabled: true)
      disabled = create(:bulk_discount, enabled: false)

      expect(described_class.enabled).to include(enabled)
      expect(described_class.enabled).to_not include(disabled)
    end

    it "#discounted_price(amount)" do
      discount = create(:bulk_discount, discount_price: 20)

      expect(discount.discounted_price(100)).to eql 80
    end
  end
end
