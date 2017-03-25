class RenameColumn < ActiveRecord::Migration[5.0]
  def change

  	rename_column :photos, :cateogry_id, :category_id
  	rename_column :comments, :description, :content

  end
end
