class Pricing < ApplicationRecord
  belongs_to :product

  monetize :amount_cents
  validates :amount_cents, presence: true, numericality: true

  def self.latest
    order(created_at: :desc).first
  end
end
