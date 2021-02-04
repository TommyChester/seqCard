class CreateCards < ActiveRecord::Migration[6.1]
  def change
    create_table :cards do |t|
      t.float :limit
      t.float :balanace

      t.timestamps
    end
  end
end
