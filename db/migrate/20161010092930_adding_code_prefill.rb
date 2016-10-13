class AddingCodePrefill < ActiveRecord::Migration
  def change
  	add_column :codes, :chivas_code?, :boolean, default: false
  	add_column :codes, :customer_id, :integer
  	add_index :codes, :code
  end
end
