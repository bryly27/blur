class IntrosController < ApplicationController
  def index
    # session[:user_id] = nil
  	if session[:user_id]
  		redirect_to '/home'
 		end
  end
  def about
  end
  def how
  end
  def careers
  end
  def faq
  end
  def terms
  end
end
