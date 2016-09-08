class AdminController < ApplicationController
  before_action :authenticate_user!

  layout false

  def index

  end

  def overview

  end

  def users
    @users = User.order(:id)
  end

  def questions

  end

  def census

  end
end
