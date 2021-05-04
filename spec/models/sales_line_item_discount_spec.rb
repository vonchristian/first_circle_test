require 'rails_helper'

describe SalesLineItemDiscount, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to :sales_line_item }
    it { is_expected.to belong_to :product }
  end

  describe 'monetize' do
    it { is_expected.to monetize(:amount) }
  end

  it ".total" do
    discount1 = create(:sales_line_item_discount, amount: 100)
    discount2 = create(:sales_line_item_discount, amount: 100)

    expect(described_class.total).to eql 200
  end

end
