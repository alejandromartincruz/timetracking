class AddPriority < ActiveRecord::Migration
  def change
  	add_column :projects, :priority, :integer, default: 0, null: false
  end
end
