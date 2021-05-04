require 'rails_helper'

describe Pricing, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to :product }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :amount_cents }
    it { is_expected.to validate_numericality_of :amount_cents }
  end

  describe 'monetize' do
    it { is_expected.to monetize(:amount) }
  end

  it ".latest" do
    old_pricing = create(:pricing, created_at: Date.current.last_month)
    new_pricing = create(:pricing, created_at: Date.current)

    expect(described_class.latest).to eq new_pricing
    expect(described_class.latest).to_not eq old_pricing
  end

end
