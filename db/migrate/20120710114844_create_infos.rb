class CreateInfos < ActiveRecord::Migration
  def self.up
    create_table :infos do |t|
     t.integer :user_id
     t.integer :client_id
     t.string :name
     t.string :job
     t.string :sex
     t.string :date_birth
     t.text :children
     t.string :mail
     t.string :m_phone
     t.string :category
     t.string :site
        
      t.timestamps
    end
  end

  def self.down
    drop_table :infos
  end
end
