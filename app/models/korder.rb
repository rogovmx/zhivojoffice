class Korder < ActiveRecord::Base
    has_many :likeit

   validates_presence_of     :name, :message=>"Поле Имя не может быть пустым."
  validates_presence_of     :phone , :message=>"Поле Телефон не может быть пустым."
end
