class RefController < ApplicationController
  before_filter:authorize
  before_filter :redaktor
  layout 'search_nofoot'
  require "will_paginate"
  
  def index
    @referals=User.find :all , :conditions=>"ref is not NULL"
    #render :text=>@referals.size.to_s
    @hiref_ids=@referals.map{|m| m.ref}.uniq
    @hiref=[]
    @hiref_ids.each do |hr|
    @hiref << User.find_by_id(hr) if User.find_by_id(hr)
    end
  end

end
