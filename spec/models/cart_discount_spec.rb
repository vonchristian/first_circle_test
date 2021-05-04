require 'rails_helper'

describe CartDiscount, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to :cart }
  end
  describe 'monetize' do
    it { is_expected.to monetize(:amount) }
  end
end
