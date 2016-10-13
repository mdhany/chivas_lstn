class AddingCodeToWinner < ActiveRecord::Migration
  def change
  	add_column :winners, :code_id, :integer
  	remove_column :winners, :invoice_id
  	remove_column :winners, :gift_id
  end
end
