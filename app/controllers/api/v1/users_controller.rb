class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      json_response = { user: { email: user.email, token: user.jwt_token } }
      status = 200
    else
      json_response = user.errors.as_json
      status = 422
    end

    render json: json_response, status: status
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
