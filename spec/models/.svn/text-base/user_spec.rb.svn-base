require 'spec_helper'

describe User, '.json_for_combo' do
  before :each do             
    @cache = {}    
  end          
  
  describe 'on success' do
    it 'should fetch users from a cache if there are users in cache'
    
    it 'should fetch users from a web service if there are no users in the cache'
    
    it 'should return a hash with the result size and user details'
  end                                                              
  
  describe 'on failure' do                     
    before :each do
      User.should_receive(:cache).and_return(@cache)
      @cache.should_receive(:fetch).and_return(@cache)
    end                                        
    
    context 'with a cache connection error' do
      it 'should not raise an error' do
        lambda {User.json_for_combo}.should_not raise_error
      end
      
      it 'should return a hash with no users' do 
        result = User.json_for_combo
        result.should be_a_kind_of(Hash)
        result['user_details'].should have(0).items
      end  
    end
                                         
    context 'with a net connection error' do         
      it 'should not raise an error' do
        lambda { User.json_for_combo }.should_not raise_error
      end
  
      it 'should return a hash with no users' do 
        result = User.json_for_combo
        result.should be_a_kind_of(Hash)
        result['user_details'].should have(0).items
      end  
    end      
  end
end

describe User, '#projects' do
  before :each do
    @user = user_with_two_projects
  end                          
  
  context 'on success' do    
    it '@user.respond_to?(:projects) should be true' do
      @user.respond_to?(:projects).should be_true
    end                                         
    
    it 'should return an array of projects related to the user' do  
      @user.projects.should be_a_kind_of(Array)
      @user.projects.should have(2).items
    end
  end
 
end