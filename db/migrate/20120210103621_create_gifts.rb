class CreateGifts < ActiveRecord::Migration
  def self.up
    create_table :gifts do |t|
      t.string :k1c
      t.timestamps
    end
  end

  def self.down
    drop_table :gifts
  end
end
