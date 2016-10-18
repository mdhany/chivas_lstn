class CodesController < ApplicationController
	before_action :authenticate_user!

  def index
  	@codes_registered_ch = Code.where(is_used?: true, chivas_code?: true).paginate(:page => params[:page])
  	@codes_not_used = Code.where(is_used?: false, chivas_code?: true).paginate(:page => params[:page])
  	@codes_not_valid = Code.where chivas_code?: false
  end

  def reset_code
  	@code = Code.find(params[:id])
  	if @code.update! is_used?: false, winner?: false, customer_id: nil
  		w = Winner.find_by code_id: @code.id
  		w.destroy if w
 
  		redirect_to codes_path, notice: "Codigo fue restaurado"
  	end
  end	


end
