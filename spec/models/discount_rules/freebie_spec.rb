require 'rails_helper'

module DiscountRules
  describe Freebie, type: :model do
    describe 'associations' do
      it { is_expected.to belong_to :product }
      it { is_expected.to belong_to :freebie_product }
    end

    describe 'delegations' do
      it { is_expected.to delegate_method(:latest_price).to(:product).with_prefix }
    end
  end
end
