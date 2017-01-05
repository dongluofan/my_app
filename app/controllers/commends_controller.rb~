class CommendsController < ApplicationController

before_filter :authorized_user, :only => [:destroy]

  private
 
  
  def authorized_user
    @commend = Commend.find(params[:id])
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
	@user=@micropost.user
	@commend=Commend.new(params[:commend])
	@commend.micropost = @micropost
	@commend.user=current_user
	if @commend.save
	flash[:success] = "Comment successfully"
	redirect_to user_path(@user)
	else
	flash[:error]="Content failed"
	redirect_to user_path(@user)
end
end
    def destroy
	@micropost = @commend.micropost
	@user=@micropost.user	
	@commend.destroy
	flash[:success] = "Destroy successfully"
	redirect_to user_path(@user)
    end
end
