class Api::V1::AuthenticationController < ApplicationController

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      render json: payload(user)
    else
      render json: {Errors: "Login Failed"}, status: 401
    end
  end

private

  def payload(user)
    return nil unless user && user.id
    {
      auth_token: JsonWebToken.encode({user_id: user.id}),
      user: {id: user.id, email: user.email}
    }
  end

end