Before("@user_with_two_projects") do
  @user = Factory.build(:user, :id => 4691)         
  # Using actual project models instead of factories due to SQL query involved in @user.projects methos  
  2.times do
    Project.create!(:user_id => @user.id, :name => Factory.next(:project_name))
  end                                                       
end

Before("@user_with_one_project") do
  @user = Factory.build(:user, :id => 4691)         
  # Using actual project models instead of factories due to SQL query involved in @user.projects methos  
  Project.create!(:user_id => @user.id, :name => Factory.next(:project_name), :description => 'a DWDM implementation')
  Project.first.update_attributes!(:user_id => @user.id)
end

Before("@user_with_no_projects") do
  @user = Factory.build(:user)         
end

Before("@fix_project_ownership") do
end