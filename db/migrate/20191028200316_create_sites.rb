class CreateSites < ActiveRecord::Migration[6.0]
  def change
    create_table :sites do |t|
      t.time :opening_time, null: false
      t.text :descritpion, null: false
      t.string :phone_number, index: { unique: true }
      t.string :website
      t.integer :category, null: false
      t.string :picture, null: false
      t.references :sector, index: true, null: false, foreign_key: true

      t.timestamps
    end
  end
end
