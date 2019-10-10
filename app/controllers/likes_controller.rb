class LikesController < ApplicationController
  def new
    @like = Like.new(like_params)
  end

  def create
    @like = current_user.likes.new(like_params)
    respond_to do |format|
      if @like.save
        format.html { redirect_to @like.comment.tour, notice: "like was successfully created." }
      else
        format.html { redirect_to @like.comment.tour, alert: @like.errors.full_messages.first}
      end
    end
  end

  def destroy
    @like = Like.find params[:id]
    comment = @like.comment
    respond_to do |format|
      if @like.destroy
        format.html { redirect_to comment.tour, notice: "unliked!"}
      end
    end
  end

  private
  def like_params
    params.require(:likes).permit(:user_id, :comment_id)
  end
end
