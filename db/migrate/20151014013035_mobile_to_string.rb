class MobileToString < ActiveRecord::Migration
  def change
    change_column :customers, :mobile, :string
  end
end
