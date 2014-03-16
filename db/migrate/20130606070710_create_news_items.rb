class CreateNewsItems < ActiveRecord::Migration
  def self.up
    create_table :news_items do |t|
      t.string :title
      t.string :image
      t.text :body
      t.string :link
      t.string :link_name
      t.boolean :visible

      t.timestamps
    end
  end

  def self.down
    drop_table :news_items
  end
end
