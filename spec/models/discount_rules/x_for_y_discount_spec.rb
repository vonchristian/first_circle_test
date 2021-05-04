require 'rails_helper'

module DiscountRules
  describe XForYDiscount, type: :model do
    describe 'associations' do
      it { is_expected.to belong_to :product }
    end

    describe "validations" do
      it { is_expected.to validate_presence_of :name }
    end

    it ".enabled" do
      enabled  = create(:x_for_y_discount, enabled: true)
      disabled = create(:x_for_y_discount, enabled: false)

      expect(described_class.enabled).to include(enabled)
      expect(described_class.enabled).to_not include(disabled)
    end
  end
end
