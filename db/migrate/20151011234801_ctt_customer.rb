class CttCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :identification, :integer

    [:collectors, :events, :entries].each do |t|
      drop_table t
    end

  end

end
