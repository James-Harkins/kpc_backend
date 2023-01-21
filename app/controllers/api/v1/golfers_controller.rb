class Api::V1::GolfersController < ApplicationController
  def index
    golfers = Golfer.all
    render json: GolferSerializer.new(golfers), status: 200
  end

  def create
    golfer = Golfer.new(golfer_params)
    if golfer.save
      render json: GolferSerializer.new(golfer), status: :created
    else
      render json: {error: golfer.errors.full_messages.to_sentence}, status: 400
    end
  end

  def destroy
    golfer = Golfer.find(params[:id])
    golfer.destroy
    render body: nil, status: :no_content
  end

  private

  def golfer_params
    params.permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
