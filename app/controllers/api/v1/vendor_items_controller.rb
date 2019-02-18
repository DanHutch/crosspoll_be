class Api::V1::VendorItemsController < ApplicationController
  before_action :authenticate_request!

  def create
    attempt_save_vendor_item(current_user.vendor_items.new(vendor_item_params))
  end

  def update

    attempt_update_vendor_item(current_user.vendor_items.find(params[:vendor_item_id]))
  end

private

  def update_vendor_item_params
    params.permit(:price, :unit, :description)
  end

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

  def attempt_update_vendor_item(vendor_item)
    if vendor_item.update(update_vendor_item_params)
      render json: VendorItemSerializer.new(vendor_item), status: 200
    else
      render json: {"Error": "Something went wrong!"}, status: 422
    end
  end

end