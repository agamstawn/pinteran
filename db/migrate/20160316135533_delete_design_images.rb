class DeleteDesignImages < ActiveRecord::Migration
  def change
  	     drop_table :design_images
  end
end
