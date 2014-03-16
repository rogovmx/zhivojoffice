class Comics1 < ActiveRecord::Base
  validates_presence_of :contacts, :message=>"Поле Контакты не может быть пустым."
end
