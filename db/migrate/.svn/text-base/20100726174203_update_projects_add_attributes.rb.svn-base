class UpdateProjectsAddAttributes < ActiveRecord::Migration
  def self.up
    add_column :projects, :cents, :integer
    add_column :projects, :currency, :string  
  end

  def self.down
    remove_column :projects, :currency
    remove_column :projects, :cents
  end
end
