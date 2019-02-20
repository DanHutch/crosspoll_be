class ApplicationController < ActionController::API
  attr_reader :current_user

  def something_went_wrong
    render json: {"Error": "Something went wrong!"}, status: 422
  end

  def payload(user)
    return nil unless user && user.id
    {
      auth_token: JsonWebToken.encode({user_id: user.id}),
      user: {id: user.id, email: user.email}
    }
  end

  def render_vendor_item(vendor_item, status = 200)
    render json: VendorItemSerializer.new(vendor_item), status: status
  end

  def render_vendor(vendor)
    render json: VendorSerializer.new(vendor)
  end

  def render_user(user, status = 200)
    render json: UserSerializer.new(user), status: status
  end


protected

  def authenticate_request!
    unless user_id_in_token?
      render json: { Error: "Authentication Failed" }, status: :unauthorized
      return
    end
    @current_user = User.find(auth_token[:user_id])
    rescue JWT::VerificationError, JWT::DecodeError
      render json: { Error: "Authentication Failed" }, status: :unauthorized
  end

private

  def http_token
      @http_token ||= if request.headers['Authorization'].present?
        request.headers['Authorization'].split(' ').last
      end
  end

  def auth_token
    @auth_token ||= JsonWebToken.decode(http_token)
  end

  def user_id_in_token?
    http_token && auth_token && auth_token[:user_id].to_i
  end

end
