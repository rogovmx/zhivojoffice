require 'digest/sha1'

#START:validate
class User3 < ActiveRecord::Base
   set_table_name 'users'
   #validates_confirmation_of :password ,:message=>"Пароли не совпадают."
   validates_length_of :password, :in => 5..20 ,:allow_nil => true, :too_long => 'Пароль должен быть не больше 20 символов.', :too_short => 'Пароль должен быть не меньше 5 символов.'

  def validate
    errors.add_to_base("Пустой пароль") if hashed_password.blank?
  end
#END:validate

  #START:login
  def self.authenticate(name, password)
    user1 = self.find :all , :conditions=>['name like ?',name] , :order=>'updated_at desc'
    unless user1
    user2 = self.find :all , :conditions=>['mail like ?',name] , :order=>'updated_at desc'
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
      for us1 in user1 do
        expected_password = encrypted_password(password, us1.salt)
        if us1.hashed_password != expected_password
        user = nil 
        else
        user=us1
         break
        end
      end 
     
 
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
