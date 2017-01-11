class CommentsController < ApplicationController
before_filter :authorized_user, :only => [:destroy]
  private
     def authorized_user
    @comment = Comment.find(params[:id])
    if @comment.user != current_user
	redirect_to user
  end
end
public
	def new
	@title = "Commend on"
	@comment=Comment.new
	end
    def create
	@micropost = Micropost.find(params[:micropost_id])
	@user=@micropost.user
	@comment=Comment.new(params[:comment])
	@comment.micropost = @micropost
	@comment.user=current_user
	if @comment.save
	flash[:success] = "Comment successfully"
	redirect_to user_path(@user)
	else
	flash[:error]="Content failed"
	redirect_to user_path(@user)
end
end
    def destroy
	@micropost = @comment.micropost
	@user=@micropost.user	
	@comment.destroy
	flash[:success] = "Destroy successfully"
	redirect_to user_path(@user)
    end
end
