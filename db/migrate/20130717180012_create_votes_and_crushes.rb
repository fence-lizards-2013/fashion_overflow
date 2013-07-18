class CreateVotesAndCrushes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :user
      t.references :crush 
      t.boolean :up
      t.timestamps
    end

    create_table :crushes do |t|
      t.string :url
      t.text :description
      t.references :user
      t.timestamps
    end
  end
end
