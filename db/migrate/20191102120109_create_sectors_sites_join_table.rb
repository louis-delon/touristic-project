class CreateSectorsSitesJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :sectors, :sites do |t|
      t.index :site_id
      t.index :sector_id
    end
  end
end
