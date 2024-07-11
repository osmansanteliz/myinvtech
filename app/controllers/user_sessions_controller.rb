class UserSessionsController < ApplicationController
  def new
    @user = User.new
    @current_time = Time.now.strftime("%d-%m-%Y %R")
  end

  def create
    @user = User.find_by(name: params[:user][:name])

    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to :controller => 'pages', :action => 'index'
    else
      flash[:alert] = "User or password incorrect."
      redirect_to new_user_session_path
    end    
  end

  def destroy
    session[:user_id] = nil
    redirect_to home_index_path
  end  
end
