class CreateReceiveds < ActiveRecord::Migration
  def self.up
    create_table :receiveds do |t|

      t.integer :number
      t.string :mail
      t.timestamps
    end
  end

  def self.down
    drop_table :receiveds
  end
end
