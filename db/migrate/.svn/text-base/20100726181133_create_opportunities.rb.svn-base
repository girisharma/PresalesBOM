class CreateOpportunities < ActiveRecord::Migration
  def self.up
    create_table :opportunities, :force => true do |t|
      t.integer :cents
      t.string :currency
      t.string :description
      t.string :name      
      t.integer :project_id 
      t.timestamps
    end
  end

  def self.down
    drop_table :opportunities
  end
end
