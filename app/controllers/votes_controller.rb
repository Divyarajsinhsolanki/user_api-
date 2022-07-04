class VotesController < ApplicationController
  before_action :authenticate_user!

  def index
    @vote = Vote.all
    render json: @vote,adapter: :json
  end

  def create
      @vote = Vote.new(vote_params)
      if already_responded?(vote_params[:liked_id ],vote_params[:liked_type])
          if @vote.action_type == "like"
                if already_liked?(vote_params[:liked_id],vote_params[:liked_type])
                  render json: {errors: 'already liked'}
                else
                  Vote.where(user_like_id: current_user.id,liked_id: vote_params[:liked_id],action_type:"dislike").first.destroy     
                  @vote.save
                  render  json: @vote,adapter: :json
                end
          else
                 if already_disliked?(vote_params[:liked_id],vote_params[:liked_type])
                  render json: {errors: 'already  disliked' }
                else
                  Vote.where(user_like_id: current_user.id,liked_id: vote_params[:liked_id],action_type:"like").first.destroy     
                  @vote.save
                  render  json: @vote,adapter: :json
                end
          end
      else
          if @vote.save
            render  json: @vote,adapter: :json
           else
            render json: { errors: @vote.errors.messages }
          end
      end
  end


  def already_liked?(liked_id,liked_type)
    Vote.where(user_like_id: current_user.id, liked_id: liked_id, action_type: "like",liked_type: liked_type).exists?
  end
  def already_disliked?(liked_id,liked_type)
    Vote.where(user_like_id: current_user.id, liked_id: liked_id, action_type: "dislike",liked_type: liked_type).exists?
  end

  def already_responded?(liked_id,liked_type)
    Vote.where(user_like_id: current_user.id, liked_id: liked_id,liked_type: liked_type).exists?
  end

  def destroy
    @vote = Vote.find(params[:id])
    if @vote.present?
      @vote.destroy
      render json: {errors: { 'vote' => ['destroy'] } }
    else
       render json: { errors: { 'vote' => ['not destroy'] } }
    end
  end

  def vote_params
    params.require(:vote).permit(:user_like_id, :liked_id,:liked_type ,:action_type)
  end

end
