class AddPositionToAddresses < ActiveRecord::Migration[6.0]
  def change
    add_column :addresses, :position, :integer, null: false
  end
end
