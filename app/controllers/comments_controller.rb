class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @conspect = Conspect.find(params[:conspect_id])
    @comment = @conspect.comments.create(params[:comment].permit(:user_name, :content))
    @comment.user_name = current_user.email
    @comment.save
    redirect_to conspect_path(@conspect)
  end

  def upvote
    @conspect = Conspect.find(params[:id])
    @comment = Comment.find(params[:conspect_id])
    if current_user.voted_up_for? @comment
      @comment.unliked_by current_user
    else
      @comment.liked_by current_user
    end
    redirect_to @conspect
  end

end