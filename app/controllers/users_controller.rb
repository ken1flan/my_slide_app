class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    if @user == current_user
      @slides = @user.slides
    else
      @slides = @user.slides.published
    end
  end
end
