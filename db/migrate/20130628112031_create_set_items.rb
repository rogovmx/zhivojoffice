class CreateSetItems < ActiveRecord::Migration
  def self.up
    create_table :set_items do |t|
      t.integer  :cat1_id
      t.string :k1c
      t.timestamps
    end
  end

  def self.down
    drop_table :set_items
  end
end
