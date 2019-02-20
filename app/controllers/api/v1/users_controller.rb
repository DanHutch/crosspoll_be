class Api::V1::UsersController < ApplicationController

  def show
    render_user(User.find(params["id"]))
  end

end