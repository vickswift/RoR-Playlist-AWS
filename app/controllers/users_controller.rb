class UsersController < ApplicationController

  def create
    userparams = params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    user = User.new(userparams)
    if user.valid?
      user.save
      session[:user_id] = user.id
      redirect_to '/songs'
    else
    # If user's login doesn't work, send them back to the login form.
      flash[:notice] = user.errors.full_messages
      redirect_to '/sessions/new'
    end
  end

end
