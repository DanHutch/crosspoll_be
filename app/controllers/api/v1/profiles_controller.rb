class Api::V1::ProfilesController < ApplicationController

  before_action :validate_password, only: [:create, :update]

  before_action :authenticate_request!, only: [:update]

  def create
    attempt_save_user(User.new(registration_params))
  end

  def update
    attempt_update
  end

private

  def validate_password
    unless params[:password] == params[:password_confirmation]
      something_went_wrong
    end
  end

  def registration_params
    params.permit(:name, :account_type, :address, :city, :state, :phone, :zip, :email, :bio, :password, :password_confirmation, :img_url)
  end

  def attempt_save_user(user_item)
    user_item.save ? render(json: payload(user_item), status: 201) : something_went_wrong
  end

  def update_params
    params.permit(:name, :account_type, :address, :city, :state, :phone, :zip, :email, :bio, :password, :img_url)
  end

  def attempt_update
    current_user.update(update_params) ? render_user(current_user) : something_went_wrong
  end

end