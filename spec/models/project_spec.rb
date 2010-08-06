require 'spec_helper'

describe Project, "associations" do
  it 'should belong to a user' do
    Project.should belong_to(:user)
  end                         
  
  it 'should have many sites' do
    Project.should have_many(:sites)
  end

  it 'should have many opportunities' do
    Project.should have_many(:opportunities)
  end

end

describe Project, 'composed_of' do
  it 'should have a composed of attribute named "cost"' do
    project = Factory.stub(:project)
    project.should respond_to(:cost)
  end
end