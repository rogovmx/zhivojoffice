class Mailer < ActionMailer::Base
  

  def welcome(user , pass , rnd) #писмо о регистрации клиенту
    content_type 'text/html'
    subject      'Спасибо за регистрацию!'
    recipients   [user.mail]
    from         'welcome@zhivojoffice.ru'
    sent_on      Time.now
    body         :rnd=>rnd,:user=>user , :pass=>pass
  end

  def welcome_poduser(user , pass , rnd) #писмо о регистрации сотруднику
    content_type  'text/html'
    subject       'Спасибо за регистрацию!'
    recipients    [user.mail ,  'mrogov@spens.ru' , 'aulanov@spens.ru']
    from          'welcome@zhivojoffice.ru'
    sent_on       Time.now
    body          :rnd=>rnd,:user=>user , :pass=>pass
  end

  def pass(mail,name,rnd) #писмо с сылкой для автоизации и изменения пароля
    content_type  'text/html'
    subject       'Сервис изменения пароля.'
    recipients    [mail,'mrogov@spens.ru']
    from          'welcome@zhivojoffice.ru'
    sent_on       Time.now
    body          :rnd=>rnd ,:name=>name

  end

#def rout1(user)
#  content_type 'text/html'
#  subject    'Участник игры Убей рутину!'
#  recipients ['achurakova@spens.ru ', 'lbutenko@spens.ru'  , 'mrogov@spens.ru'  ]
#  from       'Сайт живой офис <welcome@zhivojoffice.ru>'
#  body      :user => user
#end




  def new1(user , pass  ,dop) #писмо о регистрации клиета (приходит нам)
    content_type  'text/html'

    if user.city=='Смоленск'
    subject    ' У нас новый клиент! Смоленск '
    recipients ['vkomarov@244424.ru', 'ekirilets@244424.ru'  , 'opospelova@244424.ru', 'achuvasova@244424.ru', 'yryzhikh@244424.ru', 'etsarenkov@244424.ru' , 'kpraksina@244424.ru' , 'smolensk@zhivojoffice.ru' ,  'mrogov@spens.ru']
    elsif user.city=='Москва'
    subject    ' У нас новый клиент! Москва '
    recipients [ 'mrogov@spens.ru' , 'aulanov@spens.ru' , 'egalkina@spens.ru' ,  'apavlova@spens.ru' ]
    else
    subject    ' У нас новый клиент! Санкт-Петербург '
    recipients [ 'mrogov@spens.ru' , 'aulanov@spens.ru' , 'egalkina@spens.ru',  'izamuraeva@spens.ru']
    end
    #bcc 'iryabova@spens.ru''izamuraeva@spens.ru'
    #cc 'vplusnin@spens.ru''izamuraeva@spens.ru''iryabova@spens.ru'
    from       'Сайт живой офис <welcome@zhivojoffice.ru>'
    sent_on    Time.now
    body      :user => user , :pass=>pass , :dop=>dop
  end
  


  def zakaz1(order, card , user) #писмо о заказе (кроме отделов)
     content_type   'text/html'
     subject        'new order'

   usual_recipients(user)
#recipients     ['mrogov@spens.ru']
    if user.city=='Смоленск'
       recipients ['vkomarov@244424.ru','opospelova@244424.ru' , 'etsarenkov@244424.ru' , 'achuvasova@244424.ru', 'yryzhikh@244424.ru', 'ekirilets@244424.ru', 'smolensk@zhivojoffice.ru' , 'mrogov@spens.ru', 'zakaz_1csml@spens.ru', 'PBA@tver.audiotele.ru' ]
    elsif user.city=='Москва'
       if @m and @m.any?
       recipients [ 'ndobrynin@7303077.ru' , 'mrogov@spens.ru', 'aulanov@spens.ru' ,'zakaz_1cmsk@spens.ru' ] + @m
       elsif order.client_id == 1
       recipients [  'mrogov@spens.ru', 'aulanov@spens.ru' , 'zakaz_1cmsk@spens.ru'  ,  'apavlova@spens.ru' ]
       else
       recipients ['ndobrynin@7303077.ru' , 'mrogov@spens.ru', 'aulanov@spens.ru' , 'zakaz_1cmsk@spens.ru'  , 'apavlova@spens.ru']
       end
    else
      if @m and @m.any?
       recipients [ 'mrogov@spens.ru', 'aulanov@spens.ru' , 'zakaz_1c@spens.ru']  + @m
       elsif order.client_id == 1
       recipients [ 'mrogov@spens.ru', 'aulanov@spens.ru' , 'zakaz_1c@spens.ru'  , 'izamuraeva@spens.ru' ]
      else
       recipients [ 'mrogov@spens.ru', 'aulanov@spens.ru' , 'zakaz_1c@spens.ru', 'abelyasova@spens.ru' ]
      end
    end
      from      'Сайт Живой офис  <welcome@zhivojoffice.ru>'
      sent_on    4.hours.from_now
      body       :order => order ,  :card=>card
  end


#  def zakaz1test(order)
#     content_type 'text/html'
#     subject    'new order'
#    user=User.find_by_id(order.user_id)
#    @legals=Client.find(order.legal_id)
#    manager=Kontragent.find :first , :conditions=>['k1c=?',@legals.k1c] if @legals
#    mail=Manager.find(:first , :conditions=>['name=?', manager.manager]) if manager and manager.manager != nil
#   mail = manager if mail == nil and manager and  manager.mail != nil
#      recipients ['mrogov@spens.ru']
#      from      'Сайт Живой офис  <welcome@zhivojoffice.ru>'
#      sent_on    4.hours.from_now
#      body  :order=>order ,:mail=>mail
#  end



    def zakaz1user(order, rnd , card)
     user=User.find_by_id(order.user_id)

     content_type   'text/html'
     subject        'Ваш заказ. Живой офис'
     #recipients     ['mrogov@spens.ru']
     recipients     user.mail
     from           'Сайт Живой офис  <welcome@zhivojoffice.ru>'
     sent_on        Time.now
     body           :order=>order ,:rnd=>rnd , :card=>card

  end

  def needs(need)
     content_type   'text/html'
     subject        'Заказ того, чего нет в каталоге'
     recipients     ['mrogov@spens.ru' , 'izamuraeva@spens.ru']
     from           'Сайт Живой офис  <welcome@zhivojoffice.ru>'
     sent_on        Time.now
     body           :need=>need

  end



def feedback(fb,user) #Обратная связь

     content_type   'text/html'
     subject        'Обратная связь. Сайт Живой офис'

   usual_recipients(user)

  if user.city=='Смоленск'
      recipients ['vkomarov@244424.ru','opospelova@244424.ru' , 'etsarenkov@244424.ru' , 'ekirilets@244424.ru', 'mrogov@spens.ru']
  elsif user.city=='Москва'
      if @m  and @m.any?
      recipients ['izenkova@spens.ru', 'mrogov@spens.ru'  'aulanov@spens.ru' ] + @m
      else
      recipients ['izenkova@spens.ru', 'mrogov@spens.ru' , 'aulanov@spens.ru' , 'apavlova@spens.ru']
      end
  else
      if @m and @m.any?
      recipients ['izenkova@spens.ru', 'mrogov@spens.ru', 'aulanov@spens.ru' ] + @m
      else
      recipients ['izenkova@spens.ru', 'mrogov@spens.ru', 'aulanov@spens.ru' , 'apavlova@spens.ru']
      end
  end
 
      from      'Сайт Живой офис  <welcome@zhivojoffice.ru>'
      sent_on    Time.now
      body["fb"] = fb

  end



   def zakaz2(order, user)#Письмо о заказе сотрудника

     usual_recipients(user)
     
     content_type   'text/html'
     subject        'new order'
#recipients     ['mrogov@spens.ru']
   if user.city=='Смоленск'
       recipients ['vkomarov@244424.ru','opospelova@244424.ru' , 'etsarenkov@244424.ru' , 'achuvasova@244424.ru', 'yryzhikh@244424.ru', 'ekirilets@244424.ru', 'smolensk@zhivojoffice.ru' , 'mrogov@spens.ru', 'zakaz_1csml@spens.ru', 'PBA@tver.audiotele.ru' ]
    elsif user.city=='Москва'
       if @m and @m.any?
       recipients [ 'ndobrynin@7303077.ru', 'mrogov@spens.ru', 'aulanov@spens.ru' ,'zakaz_1cmsk@spens.ru']  + @m
       elsif order.client_id == 1
       recipients [  'mrogov@spens.ru', 'aulanov@spens.ru' ,'zakaz_1cmsk@spens.ru'  ,  'apavlova@spens.ru' ]
       else
       recipients ['ndobrynin@7303077.ru' , 'mrogov@spens.ru', 'aulanov@spens.ru' ,'zakaz_1cmsk@spens.ru'  , 'kpavlova@spens.ru']
       end
    else
       if @m and @m.any?
       recipients [ 'mrogov@spens.ru', 'aulanov@spens.ru' ,'zakaz_1c@spens.ru']  + @m
       elsif order.client_id == 1
       recipients [  'mrogov@spens.ru', 'aulanov@spens.ru' ,'zakaz_1c@spens.ru'  , 'izamuraeva@spens.ru' ]
       else
       recipients [ 'mrogov@spens.ru', 'aulanov@spens.ru' ,'zakaz_1c@spens.ru', 'abelyasova@spens.ru' ]
       end
   end
      from      'Сайт Живой офис  <welcome@zhivojoffice.ru>'
      sent_on   4.hours.from_now
      body["order"]=order
   end

#  def zakaz21 (order)
#     content_type 'text/html'
#     subject    'new order'
#     recipients    [ 'mrogov@spens.ru','zakaz_1c@spens.ru']
#     from      'Сайт Живой офис  <welcome@zhivojoffice.ru>'
#     sent_on    Time.now
#     body["order"]=order
#  end



  def zbonus (order,user) #Письмо о заказе бонусов

    usual_recipients(user)

     content_type   'text/html'
     subject        'new order bonus'
    # recipients ['mrogov@spens.ru']
  if user.city=='Смоленск'
     recipients ['vkomarov@244424.ru','opospelova@244424.ru' , 'etsarenkov@244424.ru' , 'achuvasova@244424.ru', 'yryzhikh@244424.ru', 'ekirilets@244424.ru', 'smolensk@zhivojoffice.ru' , 'mrogov@spens.ru', 'zakaz_1csml@spens.ru', 'PBA@tver.audiotele.ru' ]
  elsif user.city=='Москва'
     if @m
     recipients [ 'ndobrynin@7303077.ru' , 'mrogov@spens.ru', 'aulanov@spens.ru' ,'zakaz_1cmsk@spens.ru']  + @m
     elsif user.client1_id == 1
     recipients [  'mrogov@spens.ru', 'aulanov@spens.ru' ,'zakaz_1cmsk@spens.ru'  ,  'apavlova@spens.ru' ]
     else
     recipients ['ndobrynin@7303077.ru' , 'mrogov@spens.ru', 'aulanov@spens.ru' ,'zakaz_1cmsk@spens.ru'  , 'apavlova@spens.ru']
     end
  else
     if @m
     recipients [ 'mrogov@spens.ru', 'aulanov@spens.ru' ,'zakaz_1c@spens.ru']  + @m
     elsif user.client1_id == 1
     recipients [  'mrogov@spens.ru', 'aulanov@spens.ru' ,'zakaz_1c@spens.ru'  , 'izamuraeva@spens.ru' ]
     else
     recipients [ 'mrogov@spens.ru', 'aulanov@spens.ru' ,'zakaz_1c@spens.ru', 'izamuraeva@spens.ru' ]
     end
  end
     from      'Сайт Живой офис  <welcome@zhivojoffice.ru>'
     body :order => order , :user => user
  end



  def  zz(phone,name,quest, company)# Заказ звонка
    content_type  'text/html'
    subject       'Пожалуйста позвоните мне'
    recipients    ['mrogov@spens.ru', 'IZenkova@spens.ru', 'kpavlova@spens.ru']
    from          'Сайт Живой офис сервис заказ звонка  <welcome@zhivojoffice.ru>'
    sent_on       Time.now
    body          :phone=>phone , :name=>name,:quest=>quest , :company=>company

  end



  def netf(text) # для отправки сообщений (ошибки или информация)
    content_type  'text/html'
    subject       'Сообщение сайта' + text
    recipients    ['mrogov@spens.ru','aulanov@spens.ru']
    from          'Сайт Живой офис  рассылка  <welcome@zhivojoffice.ru>'
    body          :text =>text
    sent_on       Time.now
  end

  def msg4head(from_user) # для отправки сообщений о готовности заказа отдела
    @recip = User.find(from_user.head_id)
    content_type  'text/html'
    subject       "Сообщение о готовности заказа от #{from_user.otdel}, #{from_user.scr_name} #{from_user.surname}"
    recipients    @recip.mail
    from          'Сайт Живой офис <welcome@zhivojoffice.ru>'
    body          :from_user => from_user
    sent_on       Time.now
  end


  def null_ost(text, kill) # товары выведенные с сайта (нулевые остатки)
    content_type  'text/html'
    subject       'Сообщение сайта' + text
    recipients    'mrogov@spens.ru'
    from          'Сайт Живой офис  рассылка  <welcome@zhivojoffice.ru>'
    body          :text =>text , :kill => kill
    sent_on       Time.now
  end


  def loadprod(atmp , exist , notexist , notexist_cat , notov3, noprice) # Отчет по загрузке товаров
     content_type   'text/html'
     subject        'Отчет по загрузке товаров.'
     recipients     'mrogov@spens.ru'
     from           'Сайт Живой офис  рассылка  <welcome@zhivojoffice.ru>'
     body           :atmp =>atmp , :exist => exist , :notexist => notexist , :notexist_cat => notexist_cat , :notov3 => notov3, :noprice => noprice
  end




 def viktorina(order , user) # Письмо о победителе викторины
     
   usual_recipients(user)

     content_type   'text/html'
     subject        'Победитель викторины'

  if user.city=='Смоленск'
     recipients    [ 'vkomarov@244424.ru', 'mrogov@spens.ru','opospelova@244424.ru', 'achuvasova@244424.ru', 'yryzhikh@244424.ru', 'etsarenkov@244424.ru', 'ekirilets@244424.ru']
  elsif user.city=='Москва'
     if @m
     recipients    ['mrogov@spens.ru', 'aulanov@spens.ru' , 'izamuraeva@spens.ru' , 'eshestakova@7303077.ru'] + @m
     else
     recipients    ['mrogov@spens.ru', 'aulanov@spens.ru' ,'izamuraeva@spens.ru','eshestakova@7303077.ru']
     end
  else
     if @m
     recipients    ['mrogov@spens.ru', 'aulanov@spens.ru' ,'izamuraeva@spens.ru' ] + @m
     else
     recipients    ['mrogov@spens.ru' , 'aulanov@spens.ru' ,'izamuraeva@spens.ru', ]
     end
  end


     from      'Сайт Живой офис  <welcome@zhivojoffice.ru>'
     sent_on    Time.now
     body["order"]=order
 end



#   def info(info) # Анкета пользователя. сейчас не используется, но может понадобиться
#    @user=User.find(info.user_id)
#    @legals=Client.find(info.client_id) if info.client_id
#    manager=Kontragent.find :first , :conditions=>['k1c=?',@legals.k1c] if @legals
#    mail=Manager.find(:first , :conditions=>['name=?', manager.manager]) if manager and (manager.manager != nil)
#    hmail =  mail.helper.map{|m| m.email}.to_a if mail
#    mail2 = manager.mail if mail == nil and manager and  manager.mail != nil
#    if mail and mail.email
#      if hmail
#      m = mail.email.to_a + hmail
#      else
#      m = mail.email.to_a
#      end
#    elsif mail2
#    m = mail2.to_a
#    end
#
#     content_type   'text/html'
#     subject        'Анкета пользователя'
#
#
#     if @user.city=='Москва'
#       if m
#       recipients    ['mrogov@spens.ru' , 'eshestakova@7303077.ru' , 'izamuraeva@spens.ru' , 'apavlova@spens.ru', 'achirka@7303077.ru'  ] + @m
#       else
#       recipients    ['mrogov@spens.ru' , 'eshestakova@7303077.ru' , 'izamuraeva@spens.ru', 'apavlova@spens.ru', 'achirka@7303077.ru']
#       end
#     else
#       if m
#       recipients    ['mrogov@spens.ru' , 'ekorchagina@spens.ru' , 'izamuraeva@spens.ru', 'apavlova@spens.ru' ] + @m
#       else
#       recipients    ['mrogov@spens.ru' , 'ekorchagina@spens.ru' , 'izamuraeva@spens.ru', 'apavlova@spens.ru' ]
#       end
#     end
#
#     from      'Сайт Живой офис  <welcome@zhivojoffice.ru>'
#     sent_on    Time.now
#     body["info"]=info
#   end




  def mailer2(user) # для спама
    content_type  'text/html'
    subject       '«Живой офис»: горячие АКЦИИ – июнь 2012'
    recipients    user
    from          'Сайт Живой офис  <welcome@zhivojoffice.ru>'
    sent_on       Time.now
    body
  end


  def secret(secret)#Новое сообщение в разделе Секрет Живого офиса
    content_type  'text/html'
    subject       'Новое сообщение в разделе Секрет Живого офиса'
    recipients    ['mkolupaeva@spens.ru'  , 'atarasov@spens.ru']
    from          'welcome@zhivojoffice.ru'
    body          :secret => secret
  end


  def mailer(user)#Для спама с встроенной в письмо картинкой
    content_type  'multipart/related'
    subject       'Бумага для офисной техники "Живой офис" - уже в продаже! Серия "Драгоценные камни" - европейское качество с настроением'
    recipients    user
    from          'welcome@zhivojoffice.ru'
    sent_on       Time.now
    part          :content_type => 'text/html',
                  :body => '<a href="http://zhivojoffice.ru"><img src="cid:part1@domain.com" border="0"></a>',
                  :content_disposition => 'inline',
                  :headers => { 'content-id' => '<html-1@domain.com>' }

    part          :content_type => 'image/gif',
                  :content_disposition => 'inline',
                  :transfer_encoding => 'base64',
                  :body => File.read(RAILS_ROOT+"/public/images2/rassilka_p.jpg"),
                  :filename => 'rassilka_p.jpg',
                  :headers => { 'content-id' => '<part1@domain.com>' }
  end

private

  def usual_recipients(user) #Находим получателей писем о заказах, бонусах и пр. (менеджеры, помошники ... )
#    begin
#    @user=User.find(order.user_id)
#    rescue
#    @user=User.find(order[0].user_id)
#    end
    @legals=Client.find(user.client1_id) if user.client1_id != 0
    manager=Kontragent.find :first , :conditions=>['k1c=?',@legals.k1c] if @legals
    mail=Manager.find(:first , :conditions=>['name=?', manager.manager]) if manager and (manager.manager != nil)
    hmail =  mail.helper.map{|m| m.email}.to_a if mail
    mail2 = manager.mail if mail == nil and manager and  manager.mail != nil and manager.mail != ''

    if mail and mail.email and mail.email.strip != ''
      if hmail
      @m = mail.email.to_a + hmail
      else
      @m = mail.email.to_a
      end
    elsif mail2
      @m = mail2.to_a
    end
    return @m
  end
end
