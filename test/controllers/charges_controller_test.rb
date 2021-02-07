# frozen_string_literal: true

require 'test_helper'

class ChargesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @charge = charges(:one)
  end

  test 'should get index' do
    get charges_url
    assert_response :success
  end

  test 'should get new' do
    get new_charge_url
    assert_response :success
  end


  test 'should show charge' do
    get charge_url(@charge)
    assert_response :success
  end

  test 'should get edit' do
    get edit_charge_url(@charge)
    assert_response :success
  end



 
end
