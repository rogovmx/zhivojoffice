class CreateVacancies < ActiveRecord::Migration
  def self.up
    create_table :vacancies do |t|
      t.string :experience
      t.string :education
      t.string :shedule
      t.text :duties
      t.text :requirements
      t.text :conditions
      t.string :preference
      t.string :paiment
      t.string :contact

      t.timestamps
    end
  end

  def self.down
    drop_table :vacancies
  end
end
