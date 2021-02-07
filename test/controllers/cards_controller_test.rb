# frozen_string_literal: true

require 'test_helper'

class CardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @card = cards(:one)
  end

  test 'should get index' do
    get cards_url
    assert_response :success
  end

  test 'should get new' do
    get new_card_url
    assert_response :success
  end

  test 'should create card' do
    assert_difference('Card.count') do
      post cards_url, params: { card: { balance: @card.balance, limit: @card.limit } }
    end

    assert_redirected_to card_url(Card.last)
  end

  test 'should show card' do
    get card_url(@card)
    assert_response :success
  end

 
end
