class Gift < ActiveRecord::Base
  has_many :winners, dependent: :nullify

end
