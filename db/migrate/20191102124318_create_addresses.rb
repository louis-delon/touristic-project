class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :postal_code
      t.string :city
      t.string :latitude
      t.string :longitude
      t.references :site, null: false, foreign_key: true, index: true
      t.references :sector, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
