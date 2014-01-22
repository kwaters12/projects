class AddLikeToProjects < ActiveRecord::Migration
  def change
  	add_column :projects, :like_counter, :integer, default: 0
  end
end
