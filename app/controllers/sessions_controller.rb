class SessionsController < ApplicationController
  def index
  end

  def create
  	user = User.authenticate(params[:email], params[:password])
		if user.nil?
			flash[:error] = "Your email or password is incorrect"
	    redirect_to '/'
		else
			session[:user_id] = user.id
			redirect_to '/home'
		end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to '/'
  end
end
