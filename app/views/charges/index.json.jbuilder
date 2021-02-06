# frozen_string_literal: true

json.array! @charges, partial: 'charges/charge', as: :charge
