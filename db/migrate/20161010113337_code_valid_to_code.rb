class CodeValidToCode < ActiveRecord::Migration
  def change
  	remove_column :customers, :code_valid?
  	add_column :codes, :code_valid?,:boolean, default: false
  end
end
