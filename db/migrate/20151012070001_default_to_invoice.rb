class DefaultToInvoice < ActiveRecord::Migration
  def change
    change_column_default :invoices, :winner?, false
  end
end
