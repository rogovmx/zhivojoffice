class CreateZakazp1s < ActiveRecord::Migration
  def self.up
    create_table :zakazp1s do |t|
      t.string :adres
      t.string :tel
      t.string :fio
      t.string :city
      t.string :c_name
      t.timestamps
    end
  end

  def self.down
    drop_table :zakazp1s
  end
end
