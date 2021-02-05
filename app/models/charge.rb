class Charge < ApplicationRecord
  belongs_to :card
  validates :card, :presence => true

  def card
    self.card 
  end

  def potential_charge_over_limit?
    return true if card.limit_reached?
    return false unless self.card.balance + self.value > card.limit
    true
  end

  

end
