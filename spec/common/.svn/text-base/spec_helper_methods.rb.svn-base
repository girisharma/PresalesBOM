module SpecHelperMethods    
  # MN: This method is made to be used every time a user with two or more projects is needed
  # in order to reduce redundancy            
  def user_with_two_projects
    @user = Factory.stub(:user)    
    2.times do
      Project.create!(:user_id => @user.id, :name => Factory.next(:project_name))
    end                                       
    @user 
  end

  def user_with_one_project
    @user = Factory.stub(:user)    
    Project.create!(:user_id => @user.id, :name => Factory.next(:project_name))
    @user 
  end
end