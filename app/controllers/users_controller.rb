class UsersController < ApplicationController

before_action :authenticate_user!

  
	def index
		@users = User.all
    @user = current_user
    @book = Book.new
  end	
  	
  def show
		@user = User.find(params[:id])
		@book = Book.new
		@books = @user.books
	end	



  def create
    @user = User.create(user_params)
    @user.save
  	redirect_to user_path(@user.id)
  end



  def edit
    if params[:id].to_i == current_user.id
  	  @user = User.find(params[:id])
    else 
      redirect_to user_path(current_user)
    end
  end



def update
      @user = current_user
    if @user.update(user_params)
      flash[:notice] = 'You have updeted user successfully.'
      redirect_to user_path(current_user) 
  else
      @user = current_user
       @users = User.all
      render "users/edit"  
    end     
end 





  # def update
  # 	@user = User.find(params[:id])
  #   if @user.update(user_params)
  #     redirect_to user_path(current_user)
  #   else
  #     render "edit"
  #   end 
  # end	


  # def destroy
  # 	@user = User.find(params[:id])
  # 	@user.destroy
  # 	redirect_to user_path(@user.id) 
  # end 
	

  private
   def user_params
		params.require(:user).permit(:name, :introduction, :profile_image)
   end	
end






