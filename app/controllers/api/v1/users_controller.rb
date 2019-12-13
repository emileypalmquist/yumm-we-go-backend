class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:create, :index, :show]
 
  def profile
    render json: { user: UserSerializer.new(current_user) }, status: :accepted
  end

  def index
    users = User.all 
    render json: users
  end

  def show
    user = User.find(params[:id]) 
    render json: user
  end
 
  def create
    @user = User.create(user_params)
    if @user.valid?
      @token = encode_token({ user_id: @user.id })
      render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end
  end

  def recommended_friends
    user = User.find(params[:id])
    recommended_friends = user.recommended_friends
    render json: recommended_friends
  end
 
  private
 
  def user_params
    params.require(:user).permit(:username, :password, :email, :first_name, :last_name, :birthday)
  end
end
