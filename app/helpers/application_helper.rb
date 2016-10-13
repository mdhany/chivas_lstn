module ApplicationHelper

  def invoices_available
    Invoice.where(winner?: false)
  end

end
