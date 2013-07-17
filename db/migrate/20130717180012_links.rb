class Links < ActiveRecord::Migration
  def change
    create_table :crushes do |t|
      t.string :url
      t.text :description
      t.references :user
      t.timestamps
    end

    create_table :votes do |t|
      t.references :crush
      t.references :user
      t.boolean :up
      t.timestamps
    end
  end
end
