class CreateHorses < ActiveRecord::Migration
  def change
    create_table :horses do |t|
      t.string :name
      t.string :horse_type
      t.string :color
      t.text :description
      t.integer :foaling_day
      t.integer :foaling_month
      t.integer :foaling_year
      t.integer :sire_id
      t.integer :dam_id
      t.integer :thumb_id
      t.boolean :for_sale
      t.text :sale_description
      t.integer :sale_price
      t.boolean :for_loan
      t.text :loan_description
      t.boolean :show_online

      t.timestamps
    end
  end
end
