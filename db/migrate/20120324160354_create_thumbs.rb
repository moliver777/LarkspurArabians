class CreateThumbs < ActiveRecord::Migration
  def change
    create_table :thumbs do |t|
      t.string :filename
      t.string :image_type
      t.binary :binary_data

      t.timestamps
    end
  end
end
