class CreateSectors < ActiveRecord::Migration[6.0]
  def change
    create_table :sectors do |t|
      t.string :name, null: false
      t.string :illustration, null: false
      t.string :city, null: false
      t.text :description, null: false
      t.integer :sort, null: false

      t.timestamps
    end
  end
end
