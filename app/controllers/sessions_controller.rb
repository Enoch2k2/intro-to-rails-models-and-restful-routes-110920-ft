class SessionsController < ApplicationController
  def new # get /login
  end

  def create # post /login
    @user = User.find_by_email(params[:email])

    if @user && @user.authenticate(params[:password])
      login_user
      redirect_to movies_path
    else
      flash.now[:error] = ["Username Or Password didn't match"]
      render :new
    end
  end

  def destroy # delete /logout
    session.clear
    redirect_to root_path
  end


end
