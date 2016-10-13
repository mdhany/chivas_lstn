class CreateCodes < ActiveRecord::Migration
  def change
    create_table :codes do |t|
      t.string :code
      t.boolean :is_used?

      t.timestamps
    end

    add_column :customers, :code_valid?, :boolean, default: false
  end
end
