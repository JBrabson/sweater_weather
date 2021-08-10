class Api::V1::UsersController < ApplicationController
  before_action :generate_api_key

  def create
    user = User.new(user_params)
    user.api_key = @key
    if user.password != user.password_confirmation
      render json: {error: 'Password and Password Confirmation do not match. Please try again.'}, status: 400
    elsif User.find_by(email: user[:email]).present?
      render json: {error: 'Invalid email. Please try again.'}, status: 400
    #TODO elsif user.email.nil? || user.password.nil? && !user.password_confirmation.nil || user.password_confirmation.nil? && !user.password.nil?
    #   #   || user.password.nil? && user.password_confirmation.nil?
      # render json: {error: 'Missing a field. Please complete input.'}, status: 400
    else user.save
      render json: UsersSerializer.new(user), status: 201
    end
    #TODO edgecase for all? combinations of missing/filled fields
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end

  def generate_api_key
    @key = SecureRandom.urlsafe_base64(24)
  end
end
