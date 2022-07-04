class UsersController < ApplicationController

  before_action :authenticate_user!, only: [:index,:show,:update, :destroy]
 

  def index
    @user = User.all
    render json: @user
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: {data: {user_id: user.id, email: user.email, token: user.generate_jwt}}

    else
      render json: { errors: current_user.errors }, status: :unprocessable_entity
    end
  end
  
  def show
    @user = current_user

    render json: @user, adapter: :json      

    # render json: @user
    # render json: {data: {user_id: @user.id, email: @user.email}}
  end

  def update
   
    @user = current_user

    if @user.update(user_params)
      render json: current_user
    else      
      render json: { errors: current_user.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @user = current_user
    if @user
      @user.destroy
      
    else
       render json: current_user
    end
  end

  private


  def user_params
    params.require(:user).permit(:name,:email,:password)
  end
end