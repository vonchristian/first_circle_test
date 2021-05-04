require 'rails_helper'

describe Product, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to :storefront }
    it { is_expected.to have_many :freebies }
    it { is_expected.to have_many :bulk_discounts }
    it { is_expected.to have_many :x_for_y_discounts }
    it { is_expected.to have_many :pricings }
  end

  describe "#latest_price" do
    it "with no price set" do
      product = create(:product)
      expect(product.latest_price).to eq 0
    end

    it 'with pricing set' do
      product = create(:product)
      pricing = create(:pricing, amount: 100, product: product)

      expect(product.latest_price).to eq 100
    end
  end
end
