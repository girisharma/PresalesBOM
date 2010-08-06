class CreateSites < ActiveRecord::Migration
  def self.up
    create_table :sites do |t|
      t.string :address_1
      t.string :address_2
      t.string :city             
      t.integer :cents
      t.string :currency
      t.string :description
      t.string :location_clli
      t.string :name
      t.string :state     
      t.string :sub_location_clli      
      t.timestamps
    end
  end

  def self.down
    drop_table :sites
  end
end
