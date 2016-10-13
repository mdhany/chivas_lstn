class CodeIsWinner < ActiveRecord::Migration
  def change
  	add_column :codes, :winner?, :boolean, default: false
  end
end
