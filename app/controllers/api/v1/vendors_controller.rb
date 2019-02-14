class Api::V1::VendorsController < ApplicationController

def index
  render json: VendorSerializer.new(User.where('account_type = ?', 0))
end

end