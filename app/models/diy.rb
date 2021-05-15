class Diy < ApplicationRecord

  belongs_to :customer
  attachment :image

  has_many :favorites, dependent: :destroy
  has_many :diy_comments, dependent: :destroy
  
  belongs_to :genre

  def favorited_by?(customer)
    favorites.where(customer_id: customer.id).exists?
  end

end
