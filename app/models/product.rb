class Product < ActiveRecord::Base
  belongs_to :user

  validates :name, :amount, presence: true

  before_save :default_buyer_id

  def default_buyer_id
    self.buyer_id = 0 if self.buyer_id.nil?
  end

end
