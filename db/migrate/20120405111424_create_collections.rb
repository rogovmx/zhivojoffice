class CreateCollections < ActiveRecord::Migration
  def self.up
    create_table :collections do |t|
      t.integer :cat1_id
      t.string :k1c
      t.boolean :collection

      t.timestamps
    end
  end

  def self.down
    drop_table :collections
  end
end
