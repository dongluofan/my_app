class UsersController < ApplicationController
before_filter :authenticate, :only => [:edit, :update, :destroy]
	private
	
	def authenticate
	  if current_user.nil?
	  redirect_to signin_path, :notice =>"Please sign in"
	else
	  user =User.find(params[:id])
	  if user != current_user
	    redirect_to root_path,
	  :notice =>"Editing other users is not allowed."
	  end
	end
	end
public
  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
     @user = User.find(params[:id])
     @microposts = @user.microposts	
     @commend =Commend.new
     @title = @user.name
     params["user_id"]=@user.id
     respond_to do |format|
     format.html # show.html.erb
     format.json { render json: @users } 
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
      if @user.save
      sign_in @user
      redirect_to @user
      else
       @title = "Sign UP"
	render "new"
      end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])
    
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end
