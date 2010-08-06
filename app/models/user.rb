class User < ActiveResource::Base
  cattr_accessor :cache
  self.site = I18n.t "#{RAILS_ENV}.user_active_resource_url"
  self.element_name = "username"
  self.cache = ActiveSupport::Cache.lookup_store(:mem_cache_store)

  
  def self.json_for_combo
    users = self.cache.fetch('User.all',:expires_in => 14400) { User.find(:all) }
    s = users.collect{|spointer| spointer.json_combo_item}
    return { "results" => users.size, "user_details" => s}
  end

  def json_combo_item
    return {'user_detail'  => {'id' => remedyid,  'name' => name}}
  end
                                             
  
  def self.text_for_combo
    users = @cache.fetch('User.all',:expires_in => 14400) { User.find(:all) }
    us = users.collect{|user| [user.remedyid,user.name]}
    return us.to_json
  end
  
  def projects                                                         
    projs = Project.find(:all, :conditions => ['user_id = ?', self.id])
  end
end                                                             

