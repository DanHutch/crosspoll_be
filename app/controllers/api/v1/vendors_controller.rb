class Api::V1::VendorsController < ApplicationController

  def index
    render_vendor(User.all_vendors)
  end

end