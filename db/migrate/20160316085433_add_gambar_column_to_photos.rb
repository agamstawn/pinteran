class AddGambarColumnToPhotos < ActiveRecord::Migration
  def up
    add_attachment :photos, :gambar
  end

  def down
    remove_attachment :photos, :gambar
  end
end