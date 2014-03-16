class CreateNewyears < ActiveRecord::Migration
  def self.up
    create_table :newyears do |t|
      t.string :k1c
      t.decimal :price
      t.decimal :old_price
      t.timestamps
    end
  end

  def self.down
    drop_table :newyears
  end
end
