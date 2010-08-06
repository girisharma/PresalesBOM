class Site < ActiveRecord::Base
  # Relationships
  belongs_to :projects  
  validates_presence_of :description, :name

end
