class DeletePinteranImages < ActiveRecord::Migration
  def change
        drop_table :pinteran_images
   end
end
