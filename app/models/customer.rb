class Customer < ActiveRecord::Base
  has_many :invoices, dependent: :delete_all
  has_one :winner, dependent: :delete
  has_many :codes, dependent: :delete_all


  validates :email, presence: true, uniqueness: true
  validates :birth, presence: true
  validates :identification, presence: true, length: { is: 11 }, uniqueness: true

  def self.get_customer(email)
    customer = find_by email: email
    if customer
      customer
    else
      nil
    end
  end

end
