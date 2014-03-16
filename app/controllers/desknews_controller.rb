class DesknewsController < ApplicationController
 layout 'vvk_desk'
  def opros
    @questions = Question.find_by_id(params[:id])
    
    @q_answ_all=Questionansw.count :conditions=>['q_id=?',params[:id] ]
    @q_answ_reg=Questionansw.count  :conditions=>['user_id!=? and q_id=?',0 ,params[:id] ]
    @a1 = Questionansw.count :conditions=>['user_answ=? and q_id=?',1 ,params[:id]]
    @a2 = Questionansw.count :conditions=> ['user_answ=? and q_id=?',2 ,params[:id]]
    @a3 = Questionansw.count :conditions=> ['user_answ=? and q_id=?',3 ,params[:id]]
    @a4 = Questionansw.count :conditions=> ['user_answ=? and q_id=?',4 ,params[:id]]
    @ar1 = Questionansw.count :conditions=> ['user_answ=? and user_id!=? and q_id=?',1 ,0 ,params[:id]]
    @ar2 = Questionansw.count :conditions=> ['user_answ=? and user_id!=? and q_id=?',2 ,0 ,params[:id]]
    @ar3 = Questionansw.count :conditions=> ['user_answ=? and user_id!=? and q_id=?',3 ,0 ,params[:id]]
    @ar4 = Questionansw.count :conditions=> ['user_answ=? and user_id!=? and q_id=?',4 ,0 ,params[:id]]
  end

  def opros2

  @ff=300

  @questions = Question.find_by_id(params[:id])

    @q_all=Questionansw.count :conditions=>['q_id=? and (user_answ=? or user_answ=? or user_answ=? or user_answ=? or variant!=? or variant!=? )',params[:id], 1 , 2, 3, 4, nil , '' ]
    @q_answ_reg=Questionansw.count  :conditions=>['user_id!=? and q_id=?',0 ,params[:id] ]
    @a1 = Questionansw.count :conditions=>['user_answ=? and q_id=? and (variant=? or variant=?)',1 ,params[:id], nil , '']
    @a2 = Questionansw.count :conditions=> ['user_answ=? and q_id=? and (variant=? or variant=?)',2 ,params[:id], nil , '']
    @a3 = Questionansw.count :conditions=> ['user_answ=? and q_id=? and (variant=? or variant=?)',3 ,params[:id], nil , '']
    @a4 = Questionansw.count :conditions=> ['user_answ=? and q_id=? and (variant=? or variant=?)',4 ,params[:id], nil , '']
   @a55 = Questionansw.find_by_sql(["select * from questionansws where variant !=? and q_id=?",'' ,params[:id] ])
     @a5 = Questionansw.count  :conditions=>['q_id=? and variant!=? or variant!=? ',params[:id], '', nil ]

#@q_all=@q_all

@a1p=(100*@a1)/@q_all
@a2p=(100*@a2)/@q_all
@a3p=(100*@a3)/@q_all
@a4p=(100*@a4)/@q_all
@a5p=(100*@a5)/@q_all
@add = 100 - @a1p - @a2p - @a3p - @a4p -@a5p
@a1p=@a1p+@add


 @a1d=(@ff/100)*@a1p
@a2d=(@ff/100)*@a2p
@a3d=(@ff/100)*@a3p
@a4d=(@ff/100)*@a4p
@a5d=(@ff/100)*@a5p




  end


  def wallpaper
    
  end

  def thanks
    
  end


end
