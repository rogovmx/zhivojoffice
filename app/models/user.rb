require 'digest/sha1'

#START:validate
class User < ActiveRecord::Base
   belongs_to :client
   has_one :info
   has_many :order


#
#  validates                 :name ,
#                            :with=>/\A([-a-z0-9!\#$%&'*+\/=?^_`{|}~]+\.)*[-a-z0-9!\#$%&'*+\/=?^_`{|}~]+@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i ,
#                            :message=>"Неправильный адрес эл.почты."
#  validates                 :name, :presence => true ,
#                            :message=>"Поле E-mail(логин) не может быть пустым."
#  validates                 :name , :uniqueness => true ,
#                            :message=>"Такой E-mail уже зарегистрирован. Попробуйте другой или свяжитесь с поддержкой"
#  validates                 :phone , :presence => true , :message=>"Поле Телефон не может быть пустым."
#  validates                 :scr_name, :presence => true , :message=>"Поле Имя не может быть пустым."
#  validates                 :inn, :presence => true ,:message=>"Поле ИНН не может быть пустым."
#  validates_numericality_of :inn , :message=>"Поле ИНН должно быть числовым (только номер, без букв)."
#  validates                 :company_ind, :presence => true ,:message=>"Поле Название организации не может быть пустым."
#  validates_length_of       :password, :in => 5..20 ,:allow_nil => true, :too_long => 'Пароль должен быть не больше 20 символов.', :too_short => 'Пароль должен быть не меньше 5 символов.'
#





  validates_format_of    :name ,
                         :with=>/\A([-a-z0-9!\#$%&'*+\/=?^_`{|}~]+\.)*[-a-z0-9!\#$%&'*+\/=?^_`{|}~]+@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i ,
                         :message=>"Неправильный адрес эл.почты."
  validates_presence_of     :name,
                            :message=>"Поле E-mail(логин) не может быть пустым."
  validates_uniqueness_of   :name ,
                            :message=>"Такой E-mail уже зарегистрирован. Попробуйте другой или свяжитесь с поддержкой"
  validates_presence_of     :phone ,:message=>"Поле Телефон не может быть пустым."
  validates_presence_of     :scr_name,:message=>"Поле Имя не может быть пустым."
  validates_presence_of     :inn,:message=>"Поле ИНН не может быть пустым."
  validates_numericality_of :inn , :message=>"Поле ИНН должно быть числовым (только номер, без букв)."
  validates_presence_of     :company_ind,:message=>"Поле Название организации не может быть пустым."
  validates_length_of :password, :in => 5..20 ,:allow_nil => true, :too_long => 'Пароль должен быть не больше 20 символов.', :too_short => 'Пароль должен быть не меньше 5 символов.'





  def validate
    errors.add_to_base("Пустой пароль") if hashed_password.blank?
  end
#END:validate

  #START:login
  def self.authenticate(name, password)
    #user_tmp = self.find :all , :conditions=>['name like ?',name] , :order=>'updated_at desc'
    
    user_tmp = self.find( :all , :conditions=>['name like ?',name] , :order=>'updated_at desc') + self.find( :all , :conditions=>['mail like ?',name] , :order=>'updated_at desc')

      for us in user_tmp do
      expected_password = encrypted_password(password, us.salt)
      return us if us.hashed_password == expected_password
      end if user_tmp
    nil
  end
  #END:login

  # 'password' is a virtual attribute
  #START:accessors
  def password
    @password
  end

  def password=(pwd)
    @password = pwd
    create_new_salt
    self.hashed_password = User.encrypted_password(self.password, self.salt)
  end
  #END:accessors

  #START:after_destroy
  def after_destroy
    if User.count.zero?
      raise "Can't delete last user"
    end
  end
  #END:after_destroy

  private

  #START:create_new_salt
  def create_new_salt
    self.salt = self.object_id.to_s + rand.to_s
  end
  #END:create_new_salt

  #START:encrypted_password
  def self.encrypted_password(password, salt)
    string_to_hash = password + "wibble" + salt
    Digest::SHA1.hexdigest(string_to_hash)
  end
  #END:encrypted_password
#START:validate
end
#END:validate
