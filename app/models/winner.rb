class Winner < ActiveRecord::Base
  belongs_to :invoice
  belongs_to :gift
  belongs_to :customer
end
