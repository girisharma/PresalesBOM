Then /^I should see a list of my projects$/ do         
  response.should have_tag('li', 2)  
end
