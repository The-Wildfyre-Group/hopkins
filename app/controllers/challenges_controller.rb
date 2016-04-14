class ChallengesController < ApplicationController
  before_action :find_challenge, only: [:show, :edit, :update, :destroy]

  def index
    @challenges = Challenge.order(:position)
  end

  def new
    @challenge = Challenge.new
  end

  def create
    @challenge = Challenge.new(challenge_params)
    if @challenge.save

    else

    end
  end

  def show
  end

  def edit
  end

  def update
    if @challenge.update_attributes(challenge_params)

    else

    end
  end

  def destroy
  end

  def set_order
    order = params[:order]
    challenges = Challenge.where(id: order).order(:position)
    new_positions = challenges.map do |challenge|
      challenges[order.index(challenge.id.to_s)].position
    end
    challenges.each_with_index do |challenge, i|
      challenge.update position: new_positions[i]
    end
    render json: {}, status: :ok
  end

  protected

  def challenge_params
    params.require(:challenge).permit(:day, :challenge)
  end

  def find_challenge
    @challenge = Challenge.find_by_day(params[:day])
  end

end
