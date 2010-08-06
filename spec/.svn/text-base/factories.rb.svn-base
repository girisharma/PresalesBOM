Factory.sequence :user_id do |id|
  "#{id}" 
end     

Factory.sequence :project_name do |n|
  "Project #{n}"
end
Factory.define :money do |money|  
  money.add_attribute :id, 1
  money.currency_as_string 'USD'
end

Factory.define :user do |user|  
  user.id 1
  user.element_name 'username'
  user.division 'Metro'
  user.email 'Mark.Nyon@RCNMetro.com'
  user.employee 'Y'
  user.firstname 'Mark'
  user.floor '55 Broad Street, New York'
  user.lastname 'Nyon'
  user.location '55 Broad Street, New York'
  user.login 'mnyon'
  user.rcnempid 'x'
  user.remedyid '4691'
  user.reports 'IT'               
  user.shortcut 'WORKGROUP'
  user.title 'IT Dev Contractor'              
  user.projects {|projects| [projects.association(:project)]} 
end


Factory.define :role do |role|
  role.name 'Admin'
end

Factory.define :opportunity do |opportunity|
  opportunity.cost {|cost| cost.association(:money)}
  opportunity.name 'Opportunity'
  opportunity.description 'Opportunity Description'
  opportunity.project nil         
end

Factory.define :project do |project|
  project.cost {|cost| cost.association(:money)}
  project.name 'Project'
  project.description 'Putting in DWDM in 111 8th Street'
  project.user nil         
end
                                   
Factory.define :site do |site|
  site.name 'Site'
  site.description 'Site Description'
end