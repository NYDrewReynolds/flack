class SessionsController < ApplicationController
  
  def new
  end
  
  def create
    user = User.find_by(screen_name: params[:session][:screen_name])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:message] = "Welcome #{user.name}"
      redirect_to rooms_path
    else
      flash[:message] = "Invalid login"
      render :new
    end
  end
  
  def destroy
    session.clear
    redirect_to root_path
  end
end
