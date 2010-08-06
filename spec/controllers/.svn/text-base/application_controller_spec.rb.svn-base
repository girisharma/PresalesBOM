require 'spec_helper'
require 'factory_girl'
describe ApplicationController, '#authenticate' do
  before :each do
    @array_mock = {}                
    @user = Factory.build(:user)
  end                                                                           

  context 'on success' do
    it 'should log the user onto the site' do                                  
      controller.stub!(:get_remote_user).and_return('WORKGROUP\test_developer')
      User.should_receive(:find).and_return(@user)
      controller.authenticate.should_not be_false
      session[:current_user].should_not be_nil
    end    
    
    it 'should get the user from the user service' do
      controller.stub!(:get_remote_user).and_return('WORKGROUP\test_developer')
      User.should_receive(:find).and_return(@user)
      @array_mock.stub!(:[]).and_return('mnyon')      
      controller.authenticate.should_not be_false
      
    end
  end                    
  
  context 'on failure' do
    it 'should not log the user onto the site' do      
      controller.stub!(:get_remote_user).and_return('WORKGROUP\o3dnoeu')
      User.should_receive(:find).and_return([])
      controller.authenticate
      session[:current_user].should == []
    end
  end
end
