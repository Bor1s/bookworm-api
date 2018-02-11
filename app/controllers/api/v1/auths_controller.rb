class Api::V1::AuthsController < ApplicationController
  def create
    render json: { success: false, message: 'You need to Auth bro!' }, status: 400
  end
end
