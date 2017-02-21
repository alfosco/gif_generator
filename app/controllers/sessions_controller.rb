class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "#{user.username} Successfully Logged In"
      redirect_to user_path(user)
    else
      flash.now[:notice] = "Invalid Credentials!"
      render :new
    end
  end

end
