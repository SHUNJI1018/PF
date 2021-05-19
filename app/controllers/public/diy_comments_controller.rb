class Public::DiyCommentsController < ApplicationController
  before_action :authenticate_customer!
  
  def create
    @diy = Diy.find(params[:diy_id])
    @diy_comment = DiyComment.new(diy_comment_params)
    @diy_comment.diy_id = @diy.id
    @diy_comment.customer_id = current_customer.id
    @diy_comment_diy = @diy_comment.diy
      if @diy_comment.save
        @diy_comment_diy.create_notification_diy_comment!(current_customer, @diy_comment.id)
      else
        render 'error'
      end
  end
  
  def destroy
    @diy = Diy.find(params[:diy_id])
    diy_comment = @diy.diy_comments.find(params[:id])
    diy_comment.destroy
  end
  
  
  private
  
  def diy_comment_params
    params.require(:diy_comment).permit(:comment)
  end
  
end
