class CreatePinteranImage < ActiveRecord::Migration
  def change
    create_table :pinteran_images do |t|
      t.string :title
      t.string :content

      t.timestamps null: false
    end
  end
end
