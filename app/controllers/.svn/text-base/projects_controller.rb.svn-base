class ProjectsController < ApplicationController
  def index         
    @user = session[:current_user]
  end

  def show
    @user = session[:current_user]
    @project = Project.find(params[:id])
    if @project.user_id != @user.id
      flash[:error] = 'You do not have permission to view this project'
      redirect_to :controller => 'user', :action => 'error'
    end          
  end
  
  def new
    @user = session[:current_user]
    @project = Project.new(:user_id => @user)                                            
  end
end
