require 'spec_helper'

describe Site, 'associations' do
  it 'should belong to a project' do
    Site.should belong_to(:projects)
  end
end

describe Site, 'validations' do
  before :each do
    @site = Factory.build(:site)
  end                          
  
  it 'should validate the presence of the site name' do
    @site.should validate_presence_of(:name)
  end                                      
  
  it 'should validate the presence of a description' do
    @site.should validate_presence_of(:description)
  end  
end