# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password   
  attr_accessor :current_user
  before_filter :authenticate, :except => :error unless RAILS_ENV == 'test'
  def get_remote_user
    request.env["REMOTE_USER"] || 'workgroup\\mnyon'
  end
  
  def authenticate      
    if not session[:current_user]
      @service_username = get_remote_user.split('\\').last      
      if not @service_username
        flash[:error] = "#{get_remote_user}, you do not have access to this page."
        redirect_to :controller => '/user', :action => 'error'
      else      
        begin
          session[:current_user] = User.find(@service_username)
        rescue ActiveResource::ResourceNotFound => e
          flash[:error] = "URL #{User.site}/usernames/#{@service_username}.xml not found"
          redirect_to :controller => '/user', :action => 'error'
        rescue ActiveResource::ServerError  => e
          flash[:error] = "User Service seems to be down"
          redirect_to :controller => '/user', :action => 'error'
        rescue ArgumentError => e
          flash[:error] = "Username #{@service_username} not found"          
          redirect_to :controller => '/user', :action => 'error'
        end
      end        
    end 
  end  
end
