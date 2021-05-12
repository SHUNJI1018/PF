class Public::HomesController < ApplicationController
  
  def top
    @diys = Diy.all
    @diy_comments = DiyComment.all
  end
  
  def about
  end
  
end
