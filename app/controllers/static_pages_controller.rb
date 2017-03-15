class StaticPagesController < ApplicationController

	before_action :default_flag_set

	def home
		@logged_in = false
		@user = User.new
	end
	def timeline
		@current_page = 'timeline'
	end
	def friends
		@current_page = 'friends'
	end
	def about
		@current_page = 'about'
	end
	def photos
		@current_page = 'photos'
	end
	def about_edit
		@current_page = 'about'
	end

	private

		def default_flag_set
			@logged_in = true
			@current_page = 'home'
		end
end
