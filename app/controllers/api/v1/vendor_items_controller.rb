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
    vendor_item.save ? render_vendor_item(vendor_item, 201) : something_went_wrong
  end

  def attempt_update_vendor_item(vendor_item)
    vendor_item.update(update_vendor_item_params) ? render_vendor_item(vendor_item, 200) : something_went_wrong
  end

end