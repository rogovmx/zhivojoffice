class AboutController < ApplicationController
    layout 'search'

   def certs
#render :layout => 'search'
  end

  def letter
#render :layout => 'search'
  end

  
  def index
    render :layout => 'l_o1_pr'
  end

  def pressa
    @news_items = NewsItem.find(:all, :conditions=>['visible = ?', 1], :order => "created_at desc")
  end
  
  def IPO_zhivojoffice
    if request.get?
      render :layout => 'IPO_zhivojoffice'
    end

    if request.post? && params[:booking]
      @booking = Booking.new(params[:booking])
      if @booking.save
        redirect_to :back
        flash[:notice] = 'Ваша заявка принята.'
        Mailer.deliver_actions_booking(@booking)
        Mailer.deliver_actions_booking_response(@booking)
      end
    elsif request.post? && params[:consultation]
      @consultation = Consultation.new(params[:consultation])
      if @consultation.save
        redirect_to :back
        flash[:notice] = 'Ваша заявка принята.'
        Mailer.deliver_ipo_consultation(@consultation)
        Mailer.deliver_ipo_consultation_response(@consultation)
      end
    end

  end


  def officefile
    
  end

  def show0412
    
  end

  def forbes
    
  end

  def prime
    redirect_to("http://www.1prime.ru/Interview/20121123/757646299.html")
  end

  def finam
    redirect_to("http://www.finam.ru/analysis/newsitem71D04/default.asp")
  end

  def btl
  redirect_to("http://www.btlmag.ru/Files/Jurnal_2012/BTLmagazine_3_2012.pdf")
  end

  def redir1
    redirect_to("http://www.segment.ru/rearticles/show/3960/101/501/")
  end
   def redir2
    redirect_to("http://www.segment.ru/rearticles/show/3995/")
  end
   def redir3
    redirect_to("http://www.segment.ru/news/show/24750/")
  end
   def redir4
    redirect_to("http://www.segment.ru/news/show/24675/")
  end
   def redir5
    redirect_to("http://www.segment.ru/news/show/24641/")
  end
 def redir6
    redirect_to("http://content.yudu.com/Library/A1q7z2/OfficeFileMagazineRu/resources/index.htm?referrerUrl")
  end
  def redir7
    redirect_to("http://www.sostav.ru/vir/ofisnomu_personalu_predlozhili_ubit_rutinu.html")
  end

  def redir8
    redirect_to("http://iguru.ru/deposits/show.aspx?id={D12297B0-C848-41A5-A8D1-2B601D915189}")
  end

    def redir9
    redirect_to("http://rbctv.rbc.ru/archive/sfera_mm/562949985039233.shtml")
  end
end
