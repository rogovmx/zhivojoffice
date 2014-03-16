class CreateActcards < ActiveRecord::Migration
  def self.up
    create_table :actcards do |t|
      t.string :name
      t.integer :user_id
      t.integer :quantity
      t.boolean :used
      t.timestamps
    end
  end

  def self.down
    drop_table :actcards
  end
end
