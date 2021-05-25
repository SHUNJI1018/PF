class Notification < ApplicationRecord
  # 新着順
  default_scope -> { order(created_at: :desc) }

  belongs_to :diy, optional: true
  belongs_to :diy_comment, optional: true
  belongs_to :visiter, class_name: 'Customer', optional: true
  belongs_to :visited, class_name: 'Customer', optional: true
end
