class Api::V1::GolfersController < ApplicationController
  def create
    golfer = Golfer.new(golfer_params)
    if golfer.save
      render json: GolferSerializer.new(golfer), status: :created
    else
      render json: {error: golfer.errors.full_messages.to_sentence}, status: 400
    end
  end

  private

  def golfer_params
    params.permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
