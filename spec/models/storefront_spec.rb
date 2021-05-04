require 'rails_helper'

describe Storefront, type: :model do
  describe 'associations' do
    it { is_expected.to have_many :products }
  end
  describe 'validations' do
    it { is_expected.to validate_presence_of :name }
  end
end
