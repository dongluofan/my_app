class MicropostsController < ApplicationController
before_filter :authenticate, :only => [:create, :destroy]
before_filter :authorized_user, :only => [:destroy]
  private
  def authenticate
    if current_user.nil?
	redirect_to signin_path, :notice => "Please sign in"
    end
  end
  
  def authorized_user
    @micropost = Mcropost.find(params[:id])
    if @micropost.user != current_user
	redirect_to root_path
  end
end


  public
	def create
	  @micropost = current_user.microposts.build(params[:micropost])
	  if @micropost.save
		flash[:success] = "Micropost created"
		redirect_to root_path
	  else
	        render 'pages/home'
	  end
	end
	
	def destroy
	  @micropost.destroy
	  redirect_to root_path
	end
end
