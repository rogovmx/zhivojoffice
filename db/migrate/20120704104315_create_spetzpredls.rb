class CreateSpetzpredls < ActiveRecord::Migration
  def self.up
    create_table :spetzpredls do |t|
      t.string :k1c
      t.integer :ost
      t.boolean :spb_msk
      t.timestamps
    end
  end

  def self.down
    drop_table :spetzpredls
  end
end
