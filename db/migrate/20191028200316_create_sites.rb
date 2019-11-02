class CreateSites < ActiveRecord::Migration[6.0]
  def change
    create_table :sites do |t|
      t.text :title, null: false
      t.time :opening_time, null: false
      t.text :descritpion, null: false
      t.string :phone_number, index: { unique: true }
      t.string :website
      t.integer :category, null: false
      t.string :picture, null: false

      t.timestamps
    end
  end
end
