class Public::HomesController < ApplicationController

  def top
  end
  
  def index
    # 投稿日の降順で表示
    @diys = Diy.all.order(created_at: :desc).page(params[:page]).per(5)
    @diy_comments = DiyComment.all
  end

end
