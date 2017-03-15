class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
    	@user = User.new(whitelisted_user_params)
    	if @user.save
      		sign_in(@user)
      		flash[:success] = "Created new user!"
      		redirect_to user_path(@user)
    	else
      		flash[:error] = "Failed to Create User!"
      		render action: "new"
    	end
  	end

  	def show

  	end

	private
  		def whitelisted_user_params
    		params.require(:user).permit( 	:name,
              								:email,
              								:password,
              								:password_confirmation
              							)
  		end
end
