class CreateCartgifts < ActiveRecord::Migration
  def self.up
    create_table :cartgifts do |t|
      t.integer :user_id
      t.string :k1c
      t.integer :quantity
      t.timestamps
    end
  end

  def self.down
    drop_table :cartgifts
  end
end
