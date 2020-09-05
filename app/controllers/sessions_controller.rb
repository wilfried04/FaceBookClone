class SessionsController < ApplicationController
  def new
    if logged_in?
      redirect_to feeds_path, notice: "You are already logged!"
    else
      @user = User.new  
    end
  end
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to feeds_path
    else
      flash.now[:danger] = 'Login failed.'
      render :new
    end
  end
  def destroy
    session.delete(:user_id)
    redirect_to new_session_path
  end
end
