class Api::V1::SearchController < ApplicationController

  def index
    params["item"] ? render_vendor(with_item) : render_vendor(without_item)
  end

private

  def without_item
    User.vendor_search_without_item(params["range"], params["loc"])
  end

  def with_item
    User.vendor_search_with_item(params["item"], params[:range], params["loc"])
  end

end