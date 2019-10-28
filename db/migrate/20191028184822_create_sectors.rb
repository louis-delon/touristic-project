class CreateSectors < ActiveRecord::Migration[6.0]
  def change
    create_table :sectors do |t|
      t.string :name
      t.string :illustration
      t.string :city
      t.text :description
      t.integer :sort

      t.timestamps
    end
  end
end
