class Api::V1::GolfersController < ApplicationController
  include Authenticatable

  def index
    if authenticated?(params)
      golfers = Golfer.all
      render json: GolferSerializer.new(golfers), status: 200
    end
  end

  def create
    if authenticated?(params)
      golfer = Golfer.new(golfer_params)
      if golfer.save
        render json: GolferSerializer.new(golfer), status: :created
      else
        render json: {error: golfer.errors.full_messages.to_sentence}, status: 400
      end
    end
  end

  def destroy
    if authenticated?(params)
      golfer = Golfer.find(params[:id])
      golfer.destroy
      render body: nil, status: :no_content
    end
  end

  private

  def golfer_params
    params.require(:golfer).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
