class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    find_post
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user
    @comment.save
    render json: @post
  end

  private
    def find_post
      @post = Post.find(params[:post_id])
    end

    def comment_params
      params.require(:comment).permit(:body)
    end
end
