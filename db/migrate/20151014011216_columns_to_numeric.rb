class ColumnsToNumeric < ActiveRecord::Migration
  def change
    change_column :customers, :mobile, :string
    change_column :customers, :identification, :string
    change_column :invoices, :number, :string

  end
end
