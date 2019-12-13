class MoodsController < ApplicationController
  def index
    moods = Mood.all
    render json: moods
  end

  def show
    mood = Mood.find(params[:id])
    render json: mood
  end

  def create
    mood = Mood.create(mood_params)
    if mood.valid?
      render json: mood, status: :created
    else
      render json: { error: 'failed to create mood' }, status: :not_acceptable
    end
  end

  private
 
  def mood_params
    params.require(:mood).permit(:name, :user_id)
  end
end
