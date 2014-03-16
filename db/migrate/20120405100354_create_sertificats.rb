class CreateSertificats < ActiveRecord::Migration
  def self.up
    create_table :sertificats do |t|
      t.string :k1c
      t.string :img
      t.timestamps
    end
  end

  def self.down
    drop_table :sertificats
  end
end
