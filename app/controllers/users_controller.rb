class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.all
  end

  def show
    #@user = User.find(current_user.id)
    @user = current_user
    @outings = Outing.where(user_id: current_user).includes(:observations)
    unless @user == current_user || current_user.admin?
      redirect_to :back, :alert => "Access denied."
    end
  end

end

