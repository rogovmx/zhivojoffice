  class Info < ActiveRecord::Base
    belongs_to :user

     validates_presence_of     :name,:message=>"Незаполнено поле Имя."
    validates_presence_of     :job,:message=>"Незаполнено поле Должность"
    validates_presence_of     :sex,:message=>"Незаполнено поле Пол"
    validates_presence_of     :date_birth,:message=>"Незаполнено поле Дата рождения"
    validates_presence_of     :children,:message=>"Незаполнено поле Имя и день рождения детей"
    validates_presence_of     :mail,:message=>"Незаполнено поле E-mail"
    validates_presence_of     :m_phone,:message=>"Незаполнено поле Мобильный телефон"
    validates_presence_of     :category,:message=>"Незаполнено поле Вид деятельности"
    validates_presence_of     :site,:message=>"Незаполнено поле Сайт"

  end

