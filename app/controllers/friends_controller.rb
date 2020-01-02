class FriendsController < ApplicationController

  def index
    friends = Category.all
    render json: friends
  end

  def show
    friend = Friend.find(params[:id])
    render json: friend
  end

  def create
    friend = Friend.create(friend_params)
    if friend.valid?
      render json: friend, status: :created
    else
      render json: { error: 'failed to add friend' }, status: :not_acceptable
    end
  end

  def destroy
    friend = Friend.find(params[:id])
    if friend.destroy
      render json: {message: "Successfully deleted Friendship"}
    else
      render json: {error: "Something wen wrong"}
    end
  end

  private
 
  def friend_params
    params.require(:friend).permit(:friend_a_id, :friend_b_id)
  end
end
