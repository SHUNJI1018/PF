class Diy < ApplicationRecord
  belongs_to :customer
  belongs_to :genre
  attachment :image

  has_many :favorites, dependent: :destroy
  has_many :diy_comments, dependent: :destroy
  has_many :notifications, dependent: :destroy

  validates :genre_id, :diy_name, :image, :explanation, presence: true

  is_impressionable #counter_cache: true

  # いいね機能
  def favorited_by?(customer)
    favorites.where(customer_id: customer.id).exists?
  end

  # 通知機能
  def create_notification_by(current_customer)
    notification = current_customer.active_notifications.new(diy_id: id, visited_id: customer_id, action: 'favorite')
    notification.save if notification.valid?
  end

  def create_notification_diy_comment!(current_customer, diy_comment_id)
    # 自分以外にコメントしている人をすべて取得し、全員に通知を送る(customer_idがcurrent_customerと一致するものは除外)
    temp_ids = DiyComment.select(:customer_id).where(diy_id: id).where.not(customer_id: current_customer.id).distinct
    temp_ids.each do |temp_id|
      save_notification_diy_comment!(current_customer, diy_comment_id, temp_id['customer_id'])
    end
    save_notification_diy_comment!(current_customer, diy_comment_id, customer_id) if temp_ids.blank?
  end

  def save_notification_diy_comment!(current_customer, diy_comment_id, visited_id)
    notification = current_customer.active_notifications.new(diy_id: id, diy_comment_id: diy_comment_id,
                                                             visited_id: visited_id, action: 'diy_comment')
    # 投稿に対する自分がコメントの場合は、通知済み
    notification.checked = true if notification.visiter_id == notification.visited_id
    notification.save if notification.valid?
  end
end
