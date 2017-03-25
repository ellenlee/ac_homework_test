class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|

    	t.string :name

      t.timestamps
    end

    add_column :photos, :category_id, :integer
    add_index :photos, :category_id

  end
end
