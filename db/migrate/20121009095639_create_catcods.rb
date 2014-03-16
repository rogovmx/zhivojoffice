class CreateCatcods < ActiveRecord::Migration
  def self.up
    create_table :catcods do |t|
      t.integer :kod
      t.boolean :used
      t.integer :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :catcods
  end
end
