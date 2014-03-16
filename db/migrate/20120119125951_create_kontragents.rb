class CreateKontragents < ActiveRecord::Migration
  def self.up
    create_table :kontragents do |t|
      t.string :k1c
      t.string :kod_m
      t.string :manager
      t.timestamps
    end
  end

  def self.down
    drop_table :kontragents
  end
end
