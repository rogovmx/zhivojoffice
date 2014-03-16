class Btg1sController < ApplicationController
  # GET /btg1s
  # GET /btg1s.xml
layout 'search_nofoot'

require "will_paginate"

before_filter:authorize
before_filter :manager

  def user
    @user=User.find(session[:user_id])
  end

  def index
    user
    Btg1.all.each{|b| b.destroy if b.name==nil}
    @alf=Btg1.find_by_sql(["select distinct name from btg1s where name is not NULL and not(name like ' ') order by name asc"])
    @alf.map!{|a| a.name[0,2]}
    @alf.uniq!

    @letter=params[:letter]
    @letter='А' unless params[:letter]
    @btg1s=Btg1.find :all , :conditions=>["name like ?",@letter + '%']

    #@btg1s = Btg1.paginate :all ,:page=>params[:page], :per_page=>100  ,:order=>'name'


    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @btg1s }
    end
  end

  # GET /btg1s/1
  # GET /btg1s/1.xml
  def show

  redirect_to(:action=>'index')

  end

  # GET /btg1s/new
  # GET /btg1s/new.xml
  def new
    @btg = Btg1.new
    @btg.save
    @btg1 = Btg1.find(@btg.id)
@tov=Tov3.find :all , :order=>'name'
@present=Btg1.find :all , :select=>'tg'
@present.map!{|m| m.tg}
@tov3 = @tov.find_all{|m| m unless @present.include?(m.id)}


    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @btg1 }
    end
  end

  # GET /btg1s/1/edit
  def edit
    @btg1 = Btg1.find(params[:id])
    @tov3=Tov3.find :all , :order=>'name'

  end

  # POST /btg1s
  # POST /btg1s.xml
  def create
    @btg = Btg1.find(params[:btg1][:id].to_i)
    if  params[:btg1][:tg] != nil
    tg=Tov3.find(params[:btg1][:tg].to_i)
    params[:btg1][:name]=tg.name
    params[:btg1][:reserv]=tg.reserv
    end
    respond_to do |format|
      if @btg.update_attributes(params[:btg1])
        flash[:notice] = 'Btg1 was successfully updated.'
        format.html { redirect_to(@btg1) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @btg1.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /btg1s/1
  # PUT /btg1s/1.xml
  def update
    @btg1 = Btg1.find(params[:id])
    if  params[:btg1][:tg] != nil
    tg=Tov3.find(params[:btg1][:tg].to_i)  
    params[:btg1][:name]=tg.name
    params[:btg1][:reserv]=tg.reserv
    end
    respond_to do |format|
      if @btg1.update_attributes(params[:btg1])
        flash[:notice] = 'Сохранено'
        format.html { redirect_to :action=>'edit' , :id=>@btg1.id }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @btg1.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /btg1s/1
  # DELETE /btg1s/1.xml
  def destroy
    @btg1 = Btg1.find(params[:id])
    @btg1.destroy

    respond_to do |format|
      format.html { redirect_to(btg1s_url) }
      format.xml  { head :ok }
    end
  end
end
