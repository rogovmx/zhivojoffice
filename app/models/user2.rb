require 'digest/sha1'

#START:validate
class User2 < ActiveRecord::Base
  set_table_name 'users'
   belongs_to :client
  validates_presence_of     :name,:message=>"Поле логин не может быть пустым."
  #validates_format_of :name ,:with=>/\A([-a-z0-9!\#$%&'*+\/=?^_`{|}~]+\.)*[-a-z0-9!\#$%&'*+\/=?^_`{|}~]+@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i ,:message=>"Неправильный адрес эл.почты."
  validates_uniqueness_of   :name ,:message=>"Такой логин уже зарегистрирован. Попробуйте другой или свяжитесь с поддержкой"
  
  #attr_accessor :password_confirmation
  #validates_confirmation_of :password ,:message=>"Пароли не совпадают."
  validates_presence_of     :phone ,:message=>"Поле Телефон не может быть пустым."
 #validates_presence_of     :mail,:message=>"Поле Электронная почта не может быть пустым."
#  validates_format_of :mail ,:with=>/\A([^@\s]+)@((?:[-a-x0-9]+\.)+[a-z]{2,})\Z/i ,:message=>"Неправильный адрес эл.почты."
 
  validates_presence_of     :scr_name,:message=>"Поле Имя не может быть пустым."
  validates_length_of :password, :in => 5..20 ,:allow_nil => true, :too_long => 'Пароль должен быть не больше 20 символов.', :too_short => 'Пароль должен быть не меньше 5 символов.'

  def validate
    errors.add_to_base("Пустой пароль") if hashed_password.blank?
  end
#END:validate

  #START:login
  def self.authenticate(name, password)
    user = self.find_by_name(name)
    unless user
    user2 = self.find :all , :conditions=>['mail=?',name]
    #user = user2
    
    if user2
      for us in user2 do
      expected_password = encrypted_password(password, us.salt)
      
      if us.hashed_password != expected_password
      user = nil  
      else
      user=us
      break
      end
      end
    end
    else
     expected_password = encrypted_password(password, user.salt)
     user = nil if user.hashed_password != expected_password
    end
    user
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
