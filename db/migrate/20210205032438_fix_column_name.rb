class FixColumnName < ActiveRecord::Migration[6.1]
  def change
      rename_column :cards, :balanace, :balance
  end
end
