require 'spec_helper'

describe ProjectsController, '#index' do
  before :each do
    @user = user_with_two_projects
    session[:current_user] = @user
    get :index
  end                                        
  
  context 'on success' do
    it 'should render the projects index template' do
      response.should render_template('projects/index')      
    end    
    
    it 'should return the current user' do
      assigns[:user].should == @user
    end
  end     
end

describe ProjectsController, "#show" do
  before :each do
    @user = user_with_one_project
    session[:current_user] = @user
  end                                          
  
  context 'on success' do
    before :each do
      get :show, :id => @user.projects.first.id     
    end                                          
    
    it 'should render the project show template' do
      response.should render_template('projects/show')
    end
  
    it 'should assign the project variable' do  
      assigns[:project].should == @user.projects.first
    end                                               
  end                                                 
  
  context 'on failure' do
    
    it 'should redirect to the user error page' do
      non_matching_project = Factory.build(:project)
      Project.stub!(:find).and_return(non_matching_project)
      get :show, :id => 5000      
      response.should redirect_to('/user/error')
    end
  end  
end    

describe ProjectsController, "#new" do
  context 'on success' do
    before :each do
      get :new
    end

    it 'should render the new project template' do
      response.should render_template('projects/new')
    end                                              
    
    it 'should create a new project variable' do
      assigns[:project].should_not be_nil
      assigns[:project].new_record?.should be_true
    end
  end
end