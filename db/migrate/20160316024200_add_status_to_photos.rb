class AddStatusToPhotos < ActiveRecord::Migration
  def change
  	  add_column :photos, :status, :string
      add_column :photos, :status_two, :string
  end
end
