class User < ActiveRecord::Base

	has_one :profile, dependent: :destroy

	email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

	validates :first_name,    :presence   => true,
	          :length              				=> { :maximum => 30 }
	
	validates :last_name,    :presence   => true,
	          :length              			 => { :maximum => 30 }
	
	validates :email,   :presence   => true,
	          :format               => { :with => email_regex },
	          :uniqueness           => { :case_sensitive => false }

	# validates :email_confirmation,   :presence   => true,
	#           :format               => { :with => email_regex },
	#           :uniqueness           => { :case_sensitive => false }

	validates :password,  :presence => true,
	          :length               => { :within => 8..100 }

	# validates :password_confirmation,  :presence => true,
	#           :length               => { :within => 8..100 }



	

	def has_password?(submitted_password)
	  self.password == submitted_password
	end

	def self.authenticate(email, submitted_password)
	  user = find_by_email(email)
	  return nil if user.nil?
	  return user if user.has_password?(submitted_password)
	end
end
