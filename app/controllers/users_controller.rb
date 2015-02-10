class UsersController < ApplicationController
  def index
  end
  def create


	  now = Time.now.utc.to_date
	  age = now.year - params[:year].to_i - ((now.month > params[:month].to_i || (now.month == params[:month].to_i && now.day >= params[:day].to_i)) ? 0 : 1) 
  	
  	if age < 18
  		flash[:errors] = "You are not old enough to join"
  		redirect_to '/'
  	else
  		birthday = params[:month] + "/" + params[:day] + "/" +params[:year]
  		@user = User.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password: params[:password], gender: params[:gender], birthday: birthday, username: params[:username])
  		if @user.save
  			session[:registered] = true
  			session[:user_id] = @user.id
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
  	else
  		@user = User.find(session[:user_id])
  	end

  end

end
