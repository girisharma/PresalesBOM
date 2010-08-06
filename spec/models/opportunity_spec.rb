require 'spec_helper'

describe Opportunity, 'associations' do
  it 'should belong to projects' do
    Opportunity.should belong_to(:project)
  end                                      
  
  it 'should have many sites' do
    Opportunity.should have_many(:sites)
  end
end


describe Opportunity, 'composed_of' do
  it 'should have a composed of attribute named "cost"' do    
    opportunity = Factory.build(:opportunity)
    opportunity.should respond_to(:cost)
  end
end