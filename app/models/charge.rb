# frozen_string_literal: true

class Charge < ApplicationRecord
  belongs_to :card
  validates :card, presence: true

  def card
    puts "!!!!!!!!!!!!!!", self.card_id, "!!!!!!!!!!!!"
    Card.find(card_id)
  end

  def charge_over_limit?
    # I am trying to make the least amount of work on the system with some semi-caching,
    # I dont want it run more checks than needed. I potentially see more places
    # to cache more to save computation but I am just MVP here
    return true if card.limit_reached?
    # First check DB value
    return true if card.balance + value < card.limit

    # if not rue then update balance and and check value
    card.update_balance
    return false unless card.balance + value > card.limit

    true
  end
end
