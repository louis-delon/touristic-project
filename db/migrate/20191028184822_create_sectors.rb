class CreateSectors < ActiveRecord::Migration[6.0]
  def change
    create_table :sectors do |t|
      t.string :name, null: false
      t.string :city, null: false
      t.integer :position, null: false

      t.timestamps
    end
  end
end
