class CommentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @comments = Comment.all
    render json: @comments, adapter: :json
  end

  def new
    @comment = Comment.new
  end

  def create
     @comment = current_user.comments.build(comment_params)
    if @comment.save
      render  json: @comment,adapter: :json
    else
       render json: { errors: @comment.errors.messages }
    end
  end

  def show
    @comment = current_user.comments
    render json: @comment,adapter: :json
  end
 
  def comment_params
    params.require(:comment).permit(:body, :created_by_id, :commented_on_type, :commented_on_id)
  end

end

