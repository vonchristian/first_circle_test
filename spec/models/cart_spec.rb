require 'rails_helper'

describe Cart, type: :model do
  describe "associations" do
    it { is_expected.to have_many :sales_line_items }
    it { is_expected.to have_many :cart_discounts }
  end
end
