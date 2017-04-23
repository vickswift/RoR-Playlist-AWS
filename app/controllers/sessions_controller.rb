class SessionsController < ApplicationController
  def new
  end

  def login
    user = User.find_by_email(params[:user][:email])
    if user
      if user.try(:authenticate, params[:user][:password])
        session[:user_id] = user.id
        redirect_to '/songs'
      else
        flash[:password_error] = "Incorrect password or email address"
        redirect_to '/sessions/new'
      end
    else
    # If user's login doesn't work, send them back to the login form.
      flash[:email_error] = "Email address not found"
      redirect_to '/sessions/new'
    end

  end

  def logout
    session[:user_id] = nil
    @current_user = nil
    redirect_to '/sessions/new'
  end
end
