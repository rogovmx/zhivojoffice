class CreateFunnygoods < ActiveRecord::Migration
  def self.up
    create_table :funnygoods do |t|
      t.string :k1c
      t.timestamps
    end
  end

  def self.down
    drop_table :funnygoods
  end
end
