class Api::V1::SessionsController < ApplicationController
  include Authenticatable
  
  def create
    if authenticated?(params)
      @golfer = Golfer.find_by(email: session_params[:email])
      if @golfer&.authenticate(session_params[:password])
        login!
        render json: GolferSerializer.new(@golfer)
      elsif @golfer.nil?
        render json: {error: 'No account exists with this email.'}, status: 400
      else
        render json: {error: 'Invalid credentials.'}, status: 400
      end
    end
  end

  def is_logged_in?
    if logged_in? && current_golfer
      render json: {
        logged_in: true,
        golfer: current_golfer
      }
    else
      render json: {
        logged_in: false,
        message: 'no such golfer'
      }
    end
  end

  def destroy
    logout!
    render json: {status: 200, logged_out: true}
  end

  private

  def session_params
    params.permit(:email, :password)
  end
end
