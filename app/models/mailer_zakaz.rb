class MailerZakaz < ActionMailer::Base
  

  def zakaz(adres,tel,fio, city, c_name)
    subject    'Пожалуйста вышлите каталог'
    recipients  ['izenkova@spens.ru', 'mrogov@spens.ru', 'aulanov@spens.ru', 'apavlova@spens.ru' ]
    from       'welcome@zhivojoffice.ru'
    sent_on    Time.now
    
    body       :adres=>adres,:tel=>tel,:fio=>fio ,:city=>city, :c_name=>c_name
  end

    def zakaz_p(adres,tel,fio, city, c_name)
    subject    'Пожалуйста вышлите экспресс-каталог'
    recipients  ['izenkova@spens.ru', 'mrogov@spens.ru', 'aulanov@spens.ru', 'apavlova@spens.ru' ]
    from       'welcome@zhivojoffice.ru'
    sent_on    Time.now

    body       :adres=>adres,:tel=>tel,:fio=>fio ,:city=>city, :c_name=>c_name
  end
end
