class Api::V1::SessionsController < ApplicationController
  def create
    golfer = Golfer.find_by(email: session_params[:email])
    if golfer&.authenticate(session_params[:password])
      render json: GolferSerializer.new(golfer)
    end
  end

  private

  def session_params
    params.permit(:email, :password)
  end
end
