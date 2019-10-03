class CommentsController < ApplicationController
  before_action :logged_in_user

  def create
    @comment = current_user.comments.new(comment_params)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment.tour, notice: 'Comment was successfully created.' }
      else
        format.html { redirect_to tours_path, alert: "Create fail"}
      end
    end
  end

  private
  def logged_in_user
    unless logged_in?
      respond_to do |format|
        format.html { redirect_to login_url, alert: 'Please log in.' }
      end
    end
  end

  def comment_params
    params.require(:comment).permit(:parent_id ,:tour_id, :user_id, :content, :category_id)
  end
end

