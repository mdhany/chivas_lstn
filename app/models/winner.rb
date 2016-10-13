class Winner < ActiveRecord::Base
#  belongs_to :invoice
  belongs_to :code
  belongs_to :customer
end
