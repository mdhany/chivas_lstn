class RemovingCodeValidColumn < ActiveRecord::Migration
  def change
  	remove_column :codes, :code_valid?
  end
end
