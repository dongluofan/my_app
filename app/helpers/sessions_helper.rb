module SessionsHelper
	def sign_in(user)
	  cookies.signed[:remember_token] = user.id
	  @current_user = user
	end
	
	def current_user
	  if @current_user.nil?
	    user_id=cookies.signed[:remember_token]
	    user=User.find_by_id(user_id)
	  else
	    @current_user
	  end
	end
	
	def sign_out
	  cookies.delete(:remember_token)
	  @current_user = nil	
	end
end
