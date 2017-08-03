class Admin::ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout 'admin/application' #specifies which layout to use
end
