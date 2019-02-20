class Api::V1::AuthenticationController < ApplicationController

  def create
    try_sign_in(user_by_email_param)
  end

private

  def user_by_email_param
    User.find_by(email: params[:email])
  end

  def try_sign_in(user)
    if user.authenticate(params[:password])
      render json: payload(user)
    else
      render json: {Errors: "Login Failed"}, status: 401
    end
  end

end