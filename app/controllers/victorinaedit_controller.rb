class VictorinaeditController < ApplicationController
layout 'search_nofoot'
before_filter:authorize
before_filter :redaktor

 
  def index
    @victs = Victorina.all
  end


  def update


    respond_to do |format|
      if Victorina.update(params[:victs].keys ,params[:victs].values)
        flash[:notice] = 'Викторина обновлена. Редактор молодец.'
        format.html { redirect_to :action=>'index' }
      else
        format.html { render :action => "index" }
      end
    end
  end

  def crush
    VictorUsers.delete_all
    VictUsersQ.delete_all
    flash.now[:notice]='Таблицы опустошены'
    render :text=> 'Таблицы опустошены'
  end


end
