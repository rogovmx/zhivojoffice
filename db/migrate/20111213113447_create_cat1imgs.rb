class CreateCat1imgs < ActiveRecord::Migration
  def self.up
    create_table :cat1imgs do |t|
      t.integer :cat1_id
      t.string :pic
      t.timestamps
    end
  end

  def self.down
    drop_table :cat1imgs
  end
end
