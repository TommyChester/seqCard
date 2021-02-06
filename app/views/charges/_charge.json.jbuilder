# frozen_string_literal: true

json.extract! charge, :id, :created_at, :updated_at
json.url charge_url(charge, format: :json)
