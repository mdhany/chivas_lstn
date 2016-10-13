class CreateWinners < ActiveRecord::Migration
  def change
    create_table :winners do |t|
      t.integer :customer_id
      t.integer :gift_id
      t.integer :invoice_id

      t.timestamps
    end
  end
end
