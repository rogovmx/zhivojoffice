class CreateComix1s < ActiveRecord::Migration
  def self.up
    create_table :comix1s do |t|
      t.string :pic
      t.integer :com_id
      t.timestamps
    end
  end

  def self.down
    drop_table :comix1s
  end
end
