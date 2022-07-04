class SessionsController < Devise::SessionsController
  

  def create
    user = User.find_by_email(sign_in_params[:email])

    if user && user.valid_password?(sign_in_params[:password])
      @current_user = user
      render json: {data: {user_id: user.id, email: user.email, token: user.generate_jwt}}

    else
      render json: { errors: { 'email or password' => ['is invalid'] } }, status: :unprocessable_entity
    end
  end



  def destroy

          render  json: { errors:{ 'user' => ['logged out']}}
    #  user = current_user
    # if user
    #   user.generate_jwt = nil
      
    # else
    #   render json: { errors:{ 'user '=> ['not logged in']}}
    # end  
  end

end