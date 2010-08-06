require File.dirname(__FILE__) + '/../../spec_helper'

describe '/dashboards/index.html.erb' do
  include DashboardsHelper
  
  before :each do
    #assigns[:user] = user_with_two_projects
  end                             
  
  it 'should render the dashboard page with two projects' do
    pending('resolving cucumber user service')
    render '/dashboards/index.html.erb'     
    response.should have_tag('li', 2)
  end
end