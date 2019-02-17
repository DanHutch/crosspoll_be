class Api::V1::SearchController < ApplicationController

  def index
    if !params["item"]
      render json: VendorSerializer.new(User.within(params["range"], :origin => params["loc"]).where('account_type = ?', 0))
    elsif params["item"]
      render json: VendorSerializer.new(Item.find(params["item"]).users.within(params["range"], :origin => params["loc"]).where('account_type = ?', 0))
    end
  end


end