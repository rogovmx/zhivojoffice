class CreateMoskovs < ActiveRecord::Migration
  def self.up
    create_table :moskovs do |t|
      t.string :k1c
      t.decimal :price
      t.timestamps
    end
  end

  def self.down
    drop_table :moskovs
  end
end
