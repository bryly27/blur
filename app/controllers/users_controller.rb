class UsersController < ApplicationController
  def index
  end
  def create
  	birthday = params[:month] + "/" + params[:day] + "/" +params[:year]
  	if (birthday.to_date + 18.years) >= Date.today
  		flash[:errors] = "You are not old enough to join"
  		redirect_to '/'
  	else
  		@user = User.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password: params[:password], gender: params[:gender], birthday: birthday)
  		if @user.save
  			session[:registered] = true
  		  redirect_to '/new'
  		else
  		  flash[:errors] = @user.errors.full_messages
  			redirect_to '/'
  		end
  	end
  end

  def new
  	if session[:registered] != true
  		redirect_to '/'
  	end
  end

end
