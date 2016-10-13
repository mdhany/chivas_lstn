class InvoicesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_invoice, only: [:destroy, :show]

  def index
    @invoices = Invoice.all.order(created_at: :desc)
  end

  def show
  end

  def destroy
    @invoice.destroy
    respond_to do |format|
      format.html { redirect_to invoices_url, notice: 'invoice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_invoice
    @invoice = Invoice.find(params[:id])
  end


end
