module ApplicationHelper

  def codes_available_for_sort
    Code.where(winner?: false, is_used?: true, chivas_code?: true)
  end

end
