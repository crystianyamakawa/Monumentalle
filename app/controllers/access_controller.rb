class AccessController < ApplicationController

  before_action :authenticate_user!, :except => [:login,
    :attempt_login, :logout]

  def index
    # display text & links
  end

  def login
    # login
  end

  def attempt_login
    session[:user_id] = 1 #authorized_user.id
    current_user.username = "crystian"
    redirect_to(:controller => 'app', :action => 'index')
    # if params[:username].present? && params[:password].present?
    #   found_user = User.where(:username => params[:username]).first
    #   if found_user
    #     authorized_user = found_user #found_user.authenticate(params[:password])
    #   end
    # end
    # if authorized_user
    #   session[:user_id] = authorized_user.id
    #   current_user.username = authorized_user.username
    #
    #    flash[:notice] = "You are now logged in."
    #    redirect_to(:controller => 'app', :action => 'index')
    # else
    #   flash[:notice] = "Invalid username/password combination."
    #   redirect_to(:action => 'login')
    # end
  end

  def logout
    session[:user_id] = nil
    current_user.username = nil
    flash[:notice] = "Logged out"
    redirect_to(:controller => 'access', :action => 'login')
  end
end
