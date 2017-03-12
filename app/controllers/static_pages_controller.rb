class StaticPagesController < ApplicationController
	def home
		@logged_in = false
		@current_page_timeline = false
		@current_page_about = false
		@current_page_photos = false
	end
	def timeline
		@logged_in = true
		@current_page_timeline = true
		@current_page_about = false
		@current_page_photos = false
		@current_page_friends = false
	end
	def friends
		@logged_in = true
		@current_page_timeline = false
		@current_page_about = false
		@current_page_photos = false
		@current_page_friends = true
	end
	def about
		@logged_in = true
		@current_page_timeline = false
		@current_page_about = true
		@current_page_photos = false
		@current_page_friends = false
	end
	def photos
		@logged_in = true
		@current_page_timeline = false
		@current_page_about = false
		@current_page_photos = true
		@current_page_friends = false

	end
	def about_edit
		@logged_in = true
		@current_page_timeline = false
		@current_page_about = true
		@current_page_photos = false
		@current_page_friends = false
	end
end
