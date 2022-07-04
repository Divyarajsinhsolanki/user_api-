class PostsController < ApplicationController
  before_action :authenticate_user!

  # include ActiveStorage::SetCurrent  
  # before_action do
  #   ActiveStorage::Current.url_options = { protocol: request.protocol, host: request.host, port: request.port }
  # end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
      if @post.save
        render  json: @post,adapter: :json
      else
         render json: { errors: @post.errors.messages }
    end
  end

  

  def index
    @posts = Post.all 
    render json: @posts, include_user: true, adapter: :json
  end

  def show
    @posts = current_user.posts
    render json: @posts , include_user: false,  adapter: :json
  end


  def post_params
    params.require(:post).permit(:title,:content,:user_id, images:[] )
  end
end
