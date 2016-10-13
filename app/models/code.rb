class Code < ActiveRecord::Base

	belongs_to :customer

	validates :code, presence: true, uniqueness: true
end
