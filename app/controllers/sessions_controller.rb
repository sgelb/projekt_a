class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_name(params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      sign_in user
      flash[:notice] = "Hello #{user.name}!"
      redirect_to store_path
    else
      flash.now[:error] = "Name and/or password incorrect!"
      render 'new'
    end
  end

  def destroy
    sign_out
    flash[:notice] = "Goodbye!"
    redirect_to store_path
  end

end
