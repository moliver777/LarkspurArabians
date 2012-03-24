class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :horse_id
      t.datetime :date
      t.string :competition
      t.string :placing
      t.text :description

      t.timestamps
    end
  end
end
