class UsersController < ApplicationController

  before_action :default_flag_set

  before_action :require_current_user, :only => [:edit, :update, :destroy]
  skip_before_action :require_login, :only => [:new, :create]

	def new
		@user = User.new
	end

  def show
    @user = User.find(params[:id])
    @current_page = 'about'
  end

  def edit
    @user = User.find(params[:id])
    @current_page = 'about'
  end

  def update
    @user = User.find(params[:id])
    if @user.update(whitelisted_user_params)
      flash[:success] = "Updated user!"
      redirect_to user_path(@user)
    else
      render "edit"
    end
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

	private
  		def whitelisted_user_params
    		params.require(:user).permit( 	:first_name,
                                        :last_name,
              								          :email,
              								          :password,
              								          :password_confirmation,
                                        :birthday,
                                        :hometown,
                                        :college,
                                        :currently_lives,
                                        :telephone,
                                        :words_to_live_by,
                                        :about_me
              							       )
  		end

      def default_flag_set
        @logged_in = true
        @current_page = 'home'
      end
end
