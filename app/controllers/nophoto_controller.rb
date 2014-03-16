class NophotoController < ApplicationController
layout 'search_nofoot'
before_filter:authorize
before_filter :redaktor

require "will_paginate"

  def index
    @tov3_names = Cat1.find_by_sql("select distinct tov3_id from cat1s where (pic1 like '' or pic1 is NULL) and vis=1 ")
    @tov3_names.map! { |m| m.tov3_id if Tov3.find_by_id(m.tov3_id)  }.compact
    @tmp = Cat1.find :all , :conditions=>["(pic1 like ? or pic1 is ?) and vis=?",'',nil,1] , :order => 'created_at desc'
    unless params[:group]
    @np=@tmp.paginate  :page=>params[:page] , :per_page=>100
    else
    @tmp2 = Cat1.find :all ,  :conditions=>["(pic1 like ? or pic1 is ?) and vis=? and tov3_id =?",'',nil,1 , params[:group]] , :order => 'created_at desc'
    @np = @tmp2.paginate   :page=>params[:page] , :per_page=>100
    end
  end

    def nofile
    @cat=Cat1.find :all, :conditions=>["pic1 not like '' and pic1 is not NULL and  vis=? and tg !=?",1,'БОНУСЫ'], :order=>'tov3_id'
    @t1=[]
    for cat in @cat do
    @t1<<cat unless FileTest::exist?("public/img/#{cat.pic1.strip}.jpg")
    end
    @np=@t1.paginate  :page=>params[:page] , :per_page=>100
  end

  def upload_photo
    name =  params[:upload][:photo].original_filename
    directory = 'public/img'
    directory_1c = 'public/images_1c'
    path = File.join(directory, name)
    path_1c = File.join(directory_1c, name)
    File.open(path, "wb") { |f| f.write(params[:upload][:photo].read) }
    FileUtils.cp(path, path_1c)
    redirect_to :back
  end
end