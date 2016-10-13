class Mobiletointeger < ActiveRecord::Migration
  def change
    change_column :customers, :mobile, :integer, limit: 8
  end
end
