class CreateHelpers < ActiveRecord::Migration
  def self.up
    create_table :helpers do |t|

      t.string :name
      t.string :email
      t.integer :manager_id
      t.timestamps
    end
  end

  def self.down
    drop_table :helpers
  end
end
