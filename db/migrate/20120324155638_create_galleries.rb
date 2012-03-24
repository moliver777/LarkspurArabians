class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string :site
      t.string :title
      t.string :description
      t.integer :horse_id
      t.integer :thumb_id

      t.timestamps
    end
  end
end
