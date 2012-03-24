class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer :gallery_id
      t.string :title
      t.text :description
      t.string :filename
      t.string :image_type
      t.binary :binary_data

      t.timestamps
    end
  end
end
