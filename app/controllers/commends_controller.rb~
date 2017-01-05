class CommendsController < ApplicationController
before_filter :authenticate, :only => [:create, :destroy]
before_filter :authorized_user, :only => [:destroy]

  private
  def authenticate
    if current_user.nil?
	redirect_to signin_path, :notice => "Please sign in"
    end
  end
  
  def authorized_user
    @commend = commend.find(params[:id])
    if @commend.user != current_user
	redirect_to user
  end
end
public
	def new
	@title = "Commend on"
	@commend=Commend.new
	end
    def create
	@micropost = Micropost.find(params[:micropost_id])
	@commend=Commend.new(params[:commend])
	@commend.micropost = @micropost
	@commend.user=current_user
	if @commend.save
	flash[:success] = "Commend successfully"
	redirect_to current_user
	else
	flash[:error]="Content can not be empty"
	redirect_to user_path(current_user)
end
end
    def destroy
	@commend.destroy
	redirect_to user_path(current_user)
    end
end
