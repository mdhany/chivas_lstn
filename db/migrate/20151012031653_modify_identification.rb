class ModifyIdentification < ActiveRecord::Migration
  def change
    change_column :customers, :identification, :integer, limit: 8
  end
end
