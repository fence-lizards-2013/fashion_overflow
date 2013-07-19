class AddColumnToCrushes < ActiveRecord::Migration
  def change
    add_column :crushes, :image_uid,  :string
    add_column :crushes, :image_name, :string 
  end
end
