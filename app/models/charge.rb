class Charge < ApplicationRecord
  belongs_to :card
  validates :card, :presence => true
end
