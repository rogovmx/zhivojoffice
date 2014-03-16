class SearchController < ApplicationController
   layout 'search'
   require "will_paginate"
   require "rubygems"
   require "unicode"



  def index

  

    session[:original_uri]=request.request_uri
    user
    per_page
    session[:search]=params[:search]
    
    search=params[:search].strip if params[:search]
    @text=search.strip if search
    

    
    #if request.post?
      params[:where] == '1' if params[:where] == nil
      params[:method]=='2' if params[:method] == nil

      @split=search.downcase.split(' ') if params[:method] == '2' or params[:method] == '3' or params[:method] == nil

  if session[:city]=='msk'
  @city=' and msk=1'
  elsif session[:city]=='smo'
  @city=' and smo=1'
  else
  @city=' and spb=1'
  end

      if params[:where] == '1' or params[:where] == nil
        if params[:method]=='1' 

          if params[:brend]==nil and params[:tg]==nil
          @sqlpar='(fullname like ? or name like ? or k1c like ?  or brend like ?  or tg like ? or kpk like ? or dop like ? )' + @city
          elsif params[:brend]!=nil and params[:tg]==nil
          @sqlpar='(fullname like ? or name like ? or k1c like ?  or brend like ?  or tg like ? or kpk like ? or dop like ? )and brend like '+ "'" + params[:brend]+ "'"  + @city
          elsif params[:brend]==nil and params[:tg]!=nil
          @sqlpar='(fullname like ? or name like ? or k1c like ?  or brend like ?  or tg like ? or kpk like ? or dop like ?)and tov3_id='+params[:tg]  + @city
          elsif params[:brend]!=nil and params[:tg]!=nil
          @sqlpar='(fullname like ? or name like ? or k1c like ?  or brend like ?  or tg like ? or kpk like ? or dop like ?)and brend like '+ "'" +params[:brend]+ "'" + ' and tov3_id=' + params[:tg]  + @city
          end


          @cat_search=Cat1.find :all , :conditions=>["#{@sqlpar} and vis=? and tov3_id !=? ",'%'+search+'%','%'+search+'%','%'+search+'%','%'+search+'%','%'+search+'%','%'+search+'%','%'+search+'%',1,0], :order=>'tov3_id'
          @cat_sort_tg=@cat_search.sort{|m,n| m[:tg] <=> n[:tg]}
          @tg3all=@cat_sort_tg.map{|m| m.tov3_id}
          @tg3=@tg3all.uniq
          @brendall=@cat_search.map{|m| m.brend}.sort
          @brend=@brendall.uniq
          @search=@cat_search.paginate :page => params[:page],:per_page =>@per_page
          @count=@cat_search.size

        elsif params[:method]=='2' or params[:method]=='3' or params[:method] == nil

          if params[:brend]==nil and params[:tg]==nil
          @sqlpar='vis=1'  + @city
          elsif params[:brend]!=nil and params[:tg]==nil
          @sqlpar='brend like '+ "'" + params[:brend]+ "'"  + @city
          elsif params[:brend]==nil and params[:tg]!=nil
          @sqlpar='tov3_id='+params[:tg] + @city
          elsif params[:brend]!=nil and params[:tg]!=nil
          @sqlpar='brend like '+ "'" +params[:brend]+ "'" + ' and tov3_id=' + params[:tg] + @city
          end

        if @user and @user.role == 'redaktor'
          @cat_search=Cat1.find :all , :order=>'price'
        else
          @cat_search=Cat1.find :all , :conditions=>["#{@sqlpar} and vis=? and tov3_id !=?",1,0], :order=>'tov3_id , price'
        end
        @cat_join=@cat_search.map{|x| [x.id , [x[:fullname], x[:name], x[:k1c], x[:brend], x[:tg], x[:kpk], x[:dop]].join(' ')]}
        #render :text=>@split[0]+ ' ' + @split[1]

         if params[:method]=='2' or params[:method] == nil
            @tmp=@cat_join
            0.upto(@split.size - 1) do |i|
            @find=@tmp.find_all{|x| x if x[1].strip.downcase.index(@split[i].downcase)}
            @tmp=@find
            end
          elsif params[:method]=='3'
            @find=[]
            0.upto(@split.size - 1) do |i|
            @find+=@cat_join.find_all{|x| x if x[1].strip.downcase.index(@split[i].downcase)}
            end
          end

         @cat1=[]
      for find1 in @find do
        @tmp=Cat1.find :first , :conditions=>['id=?',find1[0].to_i ]
        @cat1<<@tmp if @tmp
      end if @find

       if @user and @user.role == 'redaktor'
       @tg3all=@cat1.map{|m| m.tov3_id}
       else
       @tg3all=@cat1.sort{|m,n| m[:tg] <=> n[:tg]}.map{|m| m.tov3_id}
       end
       @tg3=@tg3all.uniq
       @brendall=@cat1.map{|m| m.brend}.sort
       @brend=@brendall.uniq
       @search=@cat1.paginate :page => params[:page],:per_page =>@per_page
       @count=@cat1.size

       end
      elsif params[:where] == '2'      
       if params[:method]=='1'
         if params[:tg]==nil and params[:brend]==nil
         @sqlpar='(fullname like ? or name like ?)' + @city
         elsif params[:tg]!=nil and params[:brend]==nil
         @sqlpar='(fullname like ? or name like ?) and tov3_id='+params[:tg] + @city
         elsif params[:tg]==nil and params[:brend]!=nil
         @sqlpar='(fullname like ? or name like ?) and brend like '+ "'"+params[:brend]+ "'" + @city
         elsif params[:tg]!=nil and params[:brend]!=nil
         @sqlpar='(fullname like ? or name like ?) and brend like '+ "'" +params[:brend]+ "'" + ' and tov3_id=' + params[:tg] + @city
         end

          @cat_search=Cat1.find :all , :conditions=>["#{@sqlpar} and vis=? and tov3_id !=?",'%'+search+'%','%'+search+'%',1,0], :order=>'tov3_id'
          @cat_sort_tg=@cat_search.sort{|m,n| m[:tg] <=> n[:tg]}
          @tg3all=@cat_sort_tg.map{|m| m.tov3_id}
          @tg3=@tg3all.uniq
          @brendall=@cat_search.map{|m| m.brend}.sort
          @brend=@brendall.uniq
          @search=@cat_search.paginate :page => params[:page],:per_page =>@per_page
          @count=@cat_search.size

       elsif params[:method]=='2' or params[:method]=='3'
         if params[:tg]==nil and params[:brend]==nil
         @sqlpar='vis=1' + @city
         elsif params[:tg]!=nil and params[:brend]==nil
         @sqlpar='tov3_id='+params[:tg] + @city
         elsif params[:tg]==nil and params[:brend]!=nil
         @sqlpar='brend like '+ "'"+params[:brend]+ "'" + @city
         elsif params[:tg]!=nil and params[:brend]!=nil
         @sqlpar='brend like '+ "'" +params[:brend]+ "'" + ' and tov3_id=' + params[:tg] + @city
         end
 

        @cat_search=Cat1.find :all , :conditions=>["#{@sqlpar} and vis=? and tov3_id !=?",1,0], :order=>'tov3_id'
        @cat_join=@cat_search.map{|x| [x.id , x[:fullname] ? x[:fullname] : x[:name] ]}

         if params[:method]=='2'
            @tmp=@cat_join
            0.upto(@split.size - 1) do |i|
            @find=@tmp.find_all{|x| x if x[1].strip.downcase.index(@split[i].downcase)}
            @tmp=@find
            end
          elsif params[:method]=='3'
            @find=[]
            0.upto(@split.size - 1) do |i|
            @find+=@cat_join.find_all{|x| x if x[1].strip.downcase.index(@split[i].downcase)}
            end
          end

         @cat1=[]
      for find2 in @find do
        @tmp=Cat1.find :first , :conditions=>['id=?', find2[0].to_i ]
        @cat1<<@tmp if @tmp
      end

       @tg3all=@cat1.sort{|m,n| m[:tg] <=> n[:tg]}.map{|m| m.tov3_id}
       @tg3=@tg3all.uniq
       @brendall=@cat1.map{|m| m.brend}.sort
       @brend=@brendall.uniq
       @search=@cat1.paginate :page => params[:page],:per_page =>@per_page
       @count=@cat1.size
    
       end
      elsif params[:where] == '3'
       if params[:method]=='1' 
         if params[:tg]==nil and params[:brend]==nil
         @sqlpar='(tg like ?)' + @city
         elsif params[:tg]!=nil and params[:brend]==nil
         @sqlpar='(tg like ?) and tov3_id='+params[:tg] + @city
         elsif params[:tg]==nil and params[:brend]!=nil
         @sqlpar='(tg like ?) and brend like '+ "'"+params[:brend]+ "'" + @city
         elsif params[:tg]!=nil and params[:brend]!=nil
         @sqlpar='(tg like ?) and brend like '+ "'" +params[:brend]+ "'" + ' and tov3_id=' + params[:tg] + @city 
         end


          @cat_search=Cat1.find :all , :conditions=>["#{@sqlpar} and vis=? and tov3_id !=?",'%'+search+'%',1,0], :order=>'tov3_id'
          @cat_sort_tg=@cat_search.sort{|m,n| m[:tg] <=> n[:tg]}
          @tg3all=@cat_sort_tg.map{|m| m.tov3_id}
          @tg3=@tg3all.uniq
          @brendall=@cat_search.map{|m| m.brend}.sort
          @brend=@brendall.uniq
          @search=@cat_search.paginate :page => params[:page],:per_page =>@per_page
          @count=@cat_search.size
        

      elsif params[:method]=='2' or params[:method]=='3'
         if params[:tg]==nil and params[:brend]==nil
         @sqlpar='vis=1' + @city
         elsif params[:tg]!=nil and params[:brend]==nil
         @sqlpar='tov3_id='+params[:tg] + @city
         elsif params[:tg]==nil and params[:brend]!=nil
         @sqlpar='brend like '+ "'"+params[:brend]+ "'" + @city
         elsif params[:tg]!=nil and params[:brend]!=nil
         @sqlpar=' brend like '+ "'" +params[:brend]+ "'" + ' and tov3_id=?' + params[:tg] + @city
         end

        @cat_search=Cat1.find :all , :conditions=>["#{@sqlpar} and vis=? and tov3_id !=?",1,0], :order=>'tov3_id'
        @cat_join=@cat_search.map{|x| [x.id , x[:tg]]}

         if params[:method]=='2'
            @tmp=@cat_join
            0.upto(@split.size - 1) do |i|
            @find=@tmp.find_all{|x| x if x[1].strip.downcase.index(@split[i].downcase)}
            @tmp=@find
            end
          elsif params[:method]=='3'
            @find=[]
            0.upto(@split.size - 1) do |i|
            @find+=@cat_join.find_all{|x| x if x[1].strip.downcase.index(@split[i].downcase)}
            end
          end

         @cat1=[]
      for find3 in @find do
        @tmp=Cat1.find :first , :conditions=>['id=?', find3[0].to_i ]
        @cat1<<@tmp if @tmp
      end

       @tg3all=@cat1.sort{|m,n| m[:tg] <=> n[:tg]}.map{|m| m.tov3_id}
       @tg3=@tg3all.uniq
       @brendall=@cat1.map{|m| m.brend}.sort
       @brend=@brendall.uniq
       @search=@cat1.paginate :page => params[:page],:per_page =>@per_page
       @count=@cat1.size
       end
      elsif params[:where] == '4'
       if params[:method]=='1'
         if params[:tg]==nil and params[:brend]==nil
         @sqlpar='(brend like ?)' + @city
         elsif params[:tg]!=nil and params[:brend]==nil
         @sqlpar='(brend like ?) and tov3_id='+params[:tg] + @city
         elsif params[:tg]==nil and params[:brend]!=nil
         @sqlpar='(brend like ?) and brend like '+ "'"+params[:brend]+ "'" + @city
         elsif params[:tg]!=nil and params[:brend]!=nil
         @sqlpar='(brend like ?) and brend like '+ "'" +params[:brend]+ "'" + ' and tov3_id=' + params[:tg] + @city
         end

          @cat_search=Cat1.find :all , :conditions=>["#{@sqlpar} and vis=? and tov3_id !=?",'%'+search+'%',1,0], :order=>'tov3_id'
          #@cat_search=Cat1.find :all , :conditions=>["#{@sqlpar} and vis=? and tov3_id !=?",1,0], :order=>'tov3_id'
          @cat_sort_tg=@cat_search.sort{|m,n| m[:tg] <=> n[:tg]}
          @tg3all=@cat_sort_tg.map{|m| m.tov3_id}
          @tg3=@tg3all.uniq
          @brendall=@cat_search.map{|m| m.brend}.sort
          @brend=@brendall.uniq
          @search=@cat_search.paginate :page => params[:page],:per_page =>@per_page
          @count=@cat_search.size

      elsif params[:method]=='2' or params[:method]=='3'
         if params[:tg]==nil and params[:brend]==nil
         @sqlpar='vis=1' + @city
         elsif params[:tg]!=nil and params[:brend]==nil
         @sqlpar='tov3_id='+params[:tg] + @city
         elsif params[:tg]==nil and params[:brend]!=nil
         @sqlpar='brend like '+ "'"+params[:brend]+ "'" + @city
         elsif params[:tg]!=nil and params[:brend]!=nil
         @sqlpar='brend like '+ "'" +params[:brend]+ "'" + ' and tov3_id=?' + params[:tg] + @city 
         end
      

        @cat_search=Cat1.find :all , :conditions=>["#{@sqlpar} and vis=? and tov3_id !=?",1,0], :order=>'tov3_id'
        @cat_join=@cat_search.map{|x| [x.id , x[:brend]]}

         if params[:method]=='2'
            @tmp=@cat_join
            0.upto(@split.size - 1) do |i|
            @find=@tmp.find_all{|x| x if x[1].strip.downcase.index(@split[i].downcase)}
            @tmp=@find
            end
          elsif params[:method]=='3'
            @find=[]
            0.upto(@split.size - 1) do |i|
            @find+=@cat_join.find_all{|x| x if x[1].strip.downcase.index(@split[i].downcase)}
            end
          end

         @cat1=[]
      for find4 in @find do
        @tmp=Cat1.find :first , :conditions=>['id=?', find4[0].to_i ]
        @cat1<<@tmp if @tmp
      end

       @tg3all=@cat1.sort{|m,n| m[:tg] <=> n[:tg]}.map{|m| m.tov3_id}
       @tg3=@tg3all.uniq
       @brendall=@cat1.map{|m| m.brend}.sort
       @brend=@brendall.uniq
       @search=@cat1.paginate :page => params[:page],:per_page =>@per_page
       @count=@cat1.size

      end
       
      elsif params[:where] == '5'
      
      @bcat1=Bcat1.all
      @bcat_join=@bcat1.map{|x| [x.cat1_id , [x[:s3] , x[:s4], x[:s5], x[:s6], x[:s7], x[:s8], x[:s9], x[:s10], x[:s11], x[:s12], x[:s13], x[:s14], x[:s15], x[:s16], x[:s17], x[:s18], x[:s19], x[:s20], x[:s21], x[:s22], x[:s23], x[:s24], x[:s25], x[:s26], x[:s27], x[:s28], x[:s29], x[:s30]].join(' ')]}

      if params[:method] == nil or params[:method] == '1'
      @find=@bcat_join.find_all{|x| x if x[1].index(search)}
      elsif params[:method]=='2'
        @tmp=@bcat_join
        0.upto(@split.size - 1) do |i|
        @find=@tmp.find_all{|x| x if x[1].strip.downcase.index(@split[i].downcase)}
        @tmp=@find
        end
      elsif params[:method]=='3'
        @find=[]
        0.upto(@split.size - 1) do |i|
        @find+=@bcat_join.find_all{|x| x if x[1].strip.downcase.index(@split[i].downcase)}
        end
      end

      @cat1=[]
      for find6 in @find do
        @tmp=Cat1.find :first , :conditions=>['id=? and vis=?',find6[0].to_i , 1]
        @cat1<<@tmp if @tmp
      end

      if params[:tg]==nil and params[:brend]==nil
      @catf=@cat1
      elsif params[:tg]!=nil and params[:brend]==nil
      @catf=@cat1.find_all{|m| m.tov3_id == params[:tg].to_i}
      elsif params[:tg]==nil and params[:brend]!=nil
      @catf=@cat1.find_all{|m| m.brend == params[:brend]}
      elsif params[:tg]!=nil and params[:brend]!=nil
      @catf=@cat1.find_all{|m| (m.brend == params[:brend]) and (m.tov3_id == params[:tg].to_i) }
      end

       @catf.sort!{|a,b| a[:tov3_id] <=> b[:tov3_id]}
       @tg3all=@catf.map{|m| m.tov3_id}
       @tg3=@tg3all.uniq
       @brendall=@catf.map{|m| m.brend}
       @brend=@brendall.uniq
       @search=@catf.paginate :page => params[:page],:per_page =>@per_page
       @count=@catf.size


      #redirect_to :action=>'index' , :search=>params[:search]
      end

  end

  def  per_page

    @per_page=session[:per_page]
    @per_page=20 if @per_page==nil
    @per_page=500 if @per_page=='все'
   end

  def tst
    
  end




end
