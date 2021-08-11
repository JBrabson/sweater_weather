class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email].downcase)
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        render json: UsersSerializer.new(user), status: 200
      elsif !params[:email] || !params[:password]
        render json: {error: 'Missing field(s). Please enter e-mail and password.'}, status: 400
      else
        render json: {error: 'E-mail and/or password are incorrect. Please try again.'}, status: 400
      end
  end
end
