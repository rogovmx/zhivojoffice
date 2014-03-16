class Secret < ActiveRecord::Base

   validates_presence_of   :secret,
                            :message=>"Пустое сообщение"
   validates_presence_of   :name,
                            :message=>"Введите Ваше имя"
   validates_presence_of   :last_name,
                            :message=>"Введите Вашу фамилию"
   validates_presence_of   :phone,
                            :message=>"Введите телефон"
   validates_presence_of   :mail,
                            :message=>"Введите e-mail"
   validates_presence_of   :company_ind,
                            :message=>"Введите название компании"

end
