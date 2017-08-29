class Admin::ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout 'admin/application' #specifies which layout to use

  helper_method :current_user

  private
  	def current_user
  		@current_user ||=User.find(session[:user_id]) if session[:user_id]
 	end

 	def verify_loggin_in
 		unless current_user
 			redirect_to admin_login_path
 		end
  	end 
end
