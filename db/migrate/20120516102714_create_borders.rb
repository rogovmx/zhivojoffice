class CreateBorders < ActiveRecord::Migration
  def self.up
    create_table :borders do |t|
     
      t.integer :user_id
      t.string :k1c
      t.decimal :bonus_price
      t.timestamps

    end
  end

  def self.down
    drop_table :borders
  end
end
