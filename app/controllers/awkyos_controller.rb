class AwkyosController < ApplicationController
  def index
  	@user = User.find(session[:user_id])
  	@profiles = Profile.all
  	@states = states
  end

  def search_by_city
  	@user = User.find(session[:user_id])
  	@states = states
  	@profiles = Profile.where(city: params[:city])
  	render '/awkyos/index'
  end

  def search_by_state
  	@user = User.find(session[:user_id])
  	@states = states
  	@profiles = Profile.where(state: params[:id])
  	render '/awkyos/index'
  end

  def search_by_gender
  	
  	gender = []
  	profiles = Profile.all
  	profiles.each { |p| gender << p if p.user.gender == params[:id] }
  	@profiles = gender
  	@user = User.find(session[:user_id])
  	@states = states
  	render '/awkyos/index'

  	# User.select("users.first_name, users.last_name, users.email").joins(:profile).where(gender: "male")
  end

  private
    def states
      Array["Alaska", 
	          "Alabama", 
	          "Arkansas", 
	          "American Samoa", 
	          "Arizona", 
	          "California", 
	          "Colorado", 
	          "Connecticut", 
	          "District of Columbia", 
	          "Delaware", 
	          "Florida", 
	          "Georgia", 
	          "Guam", 
	          "Hawaii", 
	          "Iowa", 
	          "Idaho", 
	          "Illinois", 
	          "Indiana", 
	          "Kansas", 
	          "Kentucky", 
	          "Louisiana", 
	          "Massachusetts", 
	          "Maryland", 
	          "Maine", 
	          "Michigan", 
	          "Minnesota", 
	          "Missouri", 
	          "Mississippi", 
	          "Montana", 
	          "North Carolina", 
	          "North Dakota", 
	          "Nebraska", 
	          "New Hampshire", 
	          "New Jersey", 
	          "New Mexico", 
	          "Nevada", 
	          "New York", 
	          "Ohio", 
	          "Oklahoma", 
	          "Oregon", 
	          "Pennsylvania", 
	          "Puerto Rico", 
	          "Rhode Island", 
	          "South Carolina", 
	          "South Dakota", 
	          "Tennessee", 
	          "Texas", 
	          "Utah", 
	          "Virginia", 
	          "Virgin Islands", 
	          "Vermont", 
	          "Washington", 
	          "Wisconsin", 
	          "West Virginia", 
	          "Wyoming"]
    end

  
end
