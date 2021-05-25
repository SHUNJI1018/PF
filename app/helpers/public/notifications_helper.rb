module Public::NotificationsHelper
  def notification_form(notification)
    @visiter = notification.visiter
    @diy_comment = nil
    @visiter_diy_comment = notification.diy_comment_id
    # notification.actionの分岐
    case notification.action
    when 'follow'
      tag.a(notification.visiter.nickname, href: customer_path(@visiter),
                                           style: 'font-weight: bold;') + 'があなたをフォローしました'
    when 'favorite'
      tag.a(notification.visiter.nickname, href: customer_path(@visiter),
                                           style: 'font-weight: bold;') + 'が' + tag.a('あなたの投稿', href: diy_path(notification.diy_id),
                                                                                                style: 'font-weight: bold;') + 'にいいねしました'
    when 'diy_comment'
      @diy_comment = DiyComment.find_by(id: @visiter_diy_comment)
      tag.a(@visiter.nickname, href: customer_path(@visiter),
                               style: 'font-weight: bold;') + 'が' + tag.a('あなたの投稿', href: diy_path(notification.diy_id),
                                                                                    style: 'font-weight: bold;') + 'にコメントしました'
    end
  end

  def unchecked_notifications
    @notifications = current_customer.passive_notifications.where(checked: false)
  end
end
