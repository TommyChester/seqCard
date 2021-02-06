# frozen_string_literal: true

class CreateCharges < ActiveRecord::Migration[6.1]
  def change
    create_table :charges do |t|
      t.references :card, null: false, foreign_key: true

      t.timestamps
    end
  end
end
