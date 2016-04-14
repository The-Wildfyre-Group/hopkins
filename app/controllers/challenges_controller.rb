class ChallengesController < ApplicationController
  before_action :find_challenge, except: [:index, :new, :create]

  def index
    @challenges = Challenge.all
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

  protected

  def challenge_params
    params.require(:challenge).permit(:day, :challenge)
  end

  def find_challenge
    @challenge = Challenge.find_by_day(params[:day])
  end

end
