class UsersController < ApplicationController
  def index
    @users = User.find_by(id: params[:id])
    render json: @users
  end

  def register
    if User.find_by(username: params[:username].to_s.downcase)
      render json: { error: 'Username already exists! please choose another one.' }
    else
      @user = User.new(user_params)
      @user.username = @user.username.to_s.downcase
      if @user.save
        render json: { user: @user, logged_in: true }
      else
        render json: { error: 'There was an error, please try again!' }
      end
    end
  end

  def login
    @user = User.find_by(username: params[:username].to_s.downcase)
    if @user
      render json: { user: @user, logged_in: true }
    else
      render json: { error: 'Username is invalid' }
    end
  end

  private

  def user_params
    params.permit(:username, :email)
  end
end
