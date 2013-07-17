class Links < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :url
      t.text :description
      t.integer :up_votes
      t.integer :down_votes
      t.references :user
      t.timestamps
    end

    create_table :votes do |t|
      t.references :link
      t.references :user
      t.boolean :is_up, default: false
      t.timestamps
    end
  end
end
