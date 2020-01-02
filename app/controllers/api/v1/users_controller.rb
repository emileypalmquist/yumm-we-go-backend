class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]
 
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
    user = User.create(user_params)
    if user.valid?
      token = encode_token({ id: user.id })
      render json: { user: UserSerializer.new(user), jwt: token }, status: :created
    else
      render json: { error: 'Failed to create user. Please try again.' }, status: :not_acceptable
    end
  end

  def update
    user = User.find(params[:id])
    if user.update
      render json: user
    else
      render json: {error: "something went wrong"}
    end
  end

  def recommended_friends
    recommended_friends = current_user.recommended_friends
    render json: recommended_friends
  end

  def friends
    friends = current_user.friends
    render json: friends
  end

  def find_friends
    users = current_user.find_friends
    render json: users
  end

  private
 
  def user_params
    params.require(:user).permit(:username, :password, :email, :first_name, :last_name, :birthday)
  end
end
