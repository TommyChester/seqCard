# frozen_string_literal: true

class FixColumnName < ActiveRecord::Migration[6.1]
  # accidental misspell
  def change
    rename_column :cards, :balanace, :balance
  end
end
