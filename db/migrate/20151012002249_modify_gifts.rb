class ModifyGifts < ActiveRecord::Migration
  def change
    remove_column :gifts, :predicted
    remove_column :gifts, :event_id
    remove_column :gifts, :priority
    remove_column :gifts, :image
    remove_column :gifts, :type_g
    remove_column :gifts, :position
  end
end
