class Api::V1::SessionsController < ApplicationController
  include Authenticatable
  
  def create
    if authenticated?(params)
      golfer = Golfer.find_by(email: session_params[:email])
      if golfer&.authenticate(session_params[:password])
        render json: GolferSerializer.new(golfer)
      elsif golfer.nil?
        render json: {error: 'No account exists with this email.'}, status: 400
      else
        render json: {error: 'Invalid credentials.'}, status: 400
      end
    end
  end

  private

  def session_params
    params.permit(:email, :password)
  end
end
