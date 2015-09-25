class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(strong_user_params)
    if @user.save
      flash[:message] = "Welcome, #{@user.name}"
      @user = current_user
      redirect_to rooms_path
    else
      flash.now[:errors] = @user.errors.full_messages.join(", ")
      redirect_to new_user_path
    end
  end
  
  private
  
  def strong_user_params
    params.require(:user).permit(:name, :screen_name, :password)
  end
end
