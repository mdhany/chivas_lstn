class CodesController < ApplicationController
	before_action :authenticate_user!

  def index
  	@codes_registered_ch = Code.where(is_used?: true, chivas_code?: true).paginate(:page => params[:page])
  	@codes_not_used = Code.where(is_used?: false, chivas_code?: true).paginate(:page => params[:page])
  	@codes_not_valid = Code.where chivas_code?: false
  end


end
