class Api::V1::SessionController < ApplicationController

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
# JWT Stuff happens here!!!

    else
      render json: "Login Failed: Unauthorized", status: 401
    end
  end


end