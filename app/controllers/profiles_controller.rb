class ProfilesController < ApplicationController
  def index
  end

  def new_photo
  	@photo = Profile.where(user_id: session[:user_id])
  end

  def create
  	@profile = Profile.new(user_id: session[:user_id], avatar: params[:avatar])
  	@profile.save
  	redirect_to '/new'
  end

  def new_info
  	@states = states
  end

  def create_info
  	@profile = Profile.find_by(user_id: session[:user_id]).update(city: params[:city], state: params[:state], description: params[:description], premium: false)
  	redirect_to '/home'
  end

  def edit
    @user = User.find(session[:user_id]);
    @states = states
  end

  def update
    puts 'hello'
    puts params[:avatar]
    if params[:avatar] == nil
      @profile = Profile.find(params[:id]).update(city: params[:city], state: params[:state], description: params[:description])
      flash[:success] = "Profile Updated"
      redirect_to '/awkyo/profile/edit'
    else
      @profile = Profile.find(params[:id]).update(city: params[:city], state: params[:state], description: params[:description], avatar: params[:avatar])
      flash[:success] = "Profile Updated"
      redirect_to '/awkyo/profile/edit'
    end
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
