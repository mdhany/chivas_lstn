class Invoice < ActiveRecord::Base
  belongs_to :customer

  validates :number, presence: true
  validates :picture, presence: true

  mount_uploader :picture, PictureUploader

end
