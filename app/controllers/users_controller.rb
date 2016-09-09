class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create]

  def index
    load_users
  end

  def new
    current_user ? redirect_to(surveys_path) : build_user
  end

  def create
    build_user
    login_user or render 'new'
  end

  def show
    load_user
  end

  def settings
    load_user
  end

  def update
    load_user
    save_user or render 'settings'
  end

  def destroy
    delete_user
  end

  def completed_surveys
    data = { surveys: [], left_surveys: 0 }
    display_next = true
    {"Status" => status_surveys_path, "Services" => services_surveys_path, "Behavior" => behavior_surveys_path, "Psycho Social" => psychosocial_surveys_path, "Closing" => closing_surveys_path }.map do |survey_module, url|
      completed = current_user.completed_survey?(survey_module)
      data[:surveys] << { name: survey_module, completed: completed, url: url, display: !completed && display_next }
      data[:left_surveys] += 1 unless completed
      display_next = completed
    end
    render json: { data: data }
  end
  
  def results
    @user = current_user
    @user.check_surveys_completion
    @status = HTTParty.get('https://api.typeform.com/v0/form/X7Gqv9?key=893f6cea38785bbc15d71f06bcd07bf5e15653dd')
    @behavior = HTTParty.get('https://api.typeform.com/v0/form/n2QJzM?key=893f6cea38785bbc15d71f06bcd07bf5e15653dd')
  end

  private

  def load_users
    @users ||= user_scope.to_a
  end

  def load_user
    @user = params[:id].present? ? User.find(params[:id]) : current_user
  end

  def login_user
    if @user.save
      cookies.permanent[:authentication_token] = @user.authentication_token
      redirect_to surveys_path
    end
  end

  def build_user
    @user ||= User.new(user_params)
  end

  def save_user
    if @user.update_attributes(user_params)
      redirect_to surveys_path
    end
  end

  def user_params
    user_params = params[:user]
    user_params ? user_params.permit(:first_name, :last_name, :email, :city, :state, :education, :terms, :password, :password_confirmation, :birthdate, :race, :sex, :groups => [] ) : {}
  end

  def user_scope
    User.scoped
  end

  def delete_user
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to admin_users_path
  end
end
