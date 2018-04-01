class Api::V1::AuthsController < ApplicationController
  def create
    user = User.find_by_email(credentials[:email])
    if user && user.authenticate(credentials[:password])
      json_response = { user: { email: user.email, token: user.jwt_token } }
      status = 200
    else
      json_response = { success: false, message: 'You need to Auth bro!' }
      status = 400
    end

    render json: json_response, status: status
  end

  private

  def credentials
    params.require(:credentials).permit(:email, :password)
  end
end
