class Change < ActiveRecord::Migration
  def change
  	remove_column :profiles, :premium
  	add_column :profiles, :premium, :boolean
  end
end
