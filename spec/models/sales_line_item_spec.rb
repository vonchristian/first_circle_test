require 'rails_helper'

describe SalesLineItem, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to :product }
    it { is_expected.to belong_to :cart }
    it { is_expected.to have_many :sales_line_item_discounts }
  end

  describe 'monetize' do
    it { is_expected.to monetize(:unit_cost) }
    it { is_expected.to monetize(:total_cost) }
  end

  describe 'delegations' do
    it {is_expected.to delegate_method(:name).to(:product).with_prefix }
  end
end
