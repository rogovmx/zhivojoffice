class CreateMskpapers < ActiveRecord::Migration
  def self.up
    create_table :mskpapers do |t|
      t.string :k1c
      t.timestamps
    end
  end

  def self.down
    drop_table :mskpapers
  end
end
