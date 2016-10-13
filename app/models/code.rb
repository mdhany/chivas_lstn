class Code < ActiveRecord::Base

	belongs_to :customer
	has_one :winner

	validates :code, presence: true, uniqueness: true
end
