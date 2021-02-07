# frozen_string_literal: true

require 'test_helper'

class CardTest < ActiveSupport::TestCase
  card = Card.new
  card.updated_at = Date.today - rand(10_000)
  charge = Charge.new
  charge.card = card
  test 'Charge_are_older? when charge is newer than updated_at' do
    card.updated_at = Date.today - 1.day
    charge.updated_at = Date.today
    refute card.charges_are_older?
  end

  test 'Charge_are_older? when charge is older than updated_at' do
    card.updated_at = Date.today
    charge.updated_at = Date.today - 10.day
    refute card.charges_are_older?
  end

end
