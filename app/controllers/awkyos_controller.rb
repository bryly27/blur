class AwkyosController < ApplicationController
  def index
  	@user = User.find(session[:user_id])
  	@profiles = User.all
  end
  
end
