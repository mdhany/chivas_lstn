class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.integer :number
      t.string :picture
      t.integer :customer_id
      t.boolean :winner?

      t.timestamps
    end
  end
end
