class SessionsController < ApplicationController
  def new
      
  end
  
  def create
    #assign user if there is an existing emails
    user = User.find_by(email: params[:session][:email].downcase)
    
    if user && user.authenticate(params[:session][:password])
      #notice: user.authenticate will return the user object if password is match,if not, return False(not sure!!)
      session[:user_id] = user.id
      flash[:success] = "You have successfully logged in!"
      redirect_to user_path(user)
    else
      flash.now[:danger] = "Wrong email or password, please try again!"
      render 'new'
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash[:success] = "You have logged out!"
    redirect_to root_path
  end
end
