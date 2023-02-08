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

  def login_status
    if logged_in? && current_golfer
      render json: GolferSerializer.new(current_golfer)
    else
      render json: {data: {}}
    end
  end

  def destroy
    logout!
    render json: {status: 200, logged_out: true}
  end

  private

  def session_params
    params.require(:golfer).permit(:email, :password)
  end
end
