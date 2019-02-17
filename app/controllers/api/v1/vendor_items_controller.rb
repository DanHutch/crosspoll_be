class Api::V1::VendorItemsController < ApplicationController
  before_action :authenticate_request!

  def create
    attempt_save_vendor_item(current_user.vendor_items.new(vendor_item_params))
  end

private

  def vendor_item_params
    params.permit(:item_id, :price, :unit, :description)
  end

  def attempt_save_vendor_item(vendor_item)
    if vendor_item.save
      render json: VendorItemSerializer.new(vendor_item), status: 201
    else
      render json: {"Error": "Something went wrong!"}, status: 422
    end
  end

end