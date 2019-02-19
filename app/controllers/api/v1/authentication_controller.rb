class Api::V1::AuthenticationController < ApplicationController

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      render json: payload(user)
    else
      render json: {Errors: "Login Failed"}, status: 401
    end
  end

end