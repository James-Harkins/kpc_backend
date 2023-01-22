module Authenticatable
  def authenticated?(params)
    params[:api_key] == ENV["API_KEY"]
  end
end
