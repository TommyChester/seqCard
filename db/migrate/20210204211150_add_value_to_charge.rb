class AddValueToCharge < ActiveRecord::Migration[6.1]
  def change
    add_column :charges, :value, :float
  end
end
