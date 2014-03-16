class PodvalsController < ApplicationController
  layout 'search_nofoot'
  before_filter :authorize
  before_filter :redaktor

  # GET /podvals
  # GET /podvals.xml
  def index
    @podvals = Podval.find(:all)
    @podval = Podval.find_by_main(1)
    if @podval == nil
      @podvals = Podval.find_all_by_vis(1)
      @podval = @podvals.choice
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @podvals }
    end
  end

  # GET /podvals/new
  # GET /podvals/new.xml
  def new
    @podval = Podval.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @podval }
    end
  end

  # GET /podvals/1/edit
  def edit
    @podval = Podval.find(params[:id])
  end

  # POST /podvals
  # POST /podvals.xml
  def create
    @podval = Podval.new(params[:podval])
    name1 =  params[:podval][:tov1img].original_filename if params[:podval][:tov1img]
    name2 =  params[:podval][:tov2img].original_filename if params[:podval][:tov2img]
    name3 =  params[:podval][:tov3img].original_filename if params[:podval][:tov3img]
    name4 =  params[:podval][:tov4img].original_filename if params[:podval][:tov4img]
    name5 =  params[:podval][:tov5img].original_filename if params[:podval][:tov5img]
    name6 =  params[:podval][:divup].original_filename if params[:podval][:divup]
    name7 =  params[:podval][:divdown].original_filename if params[:podval][:divdown]
    directory = 'public/images/podval'

    path1 = File.join(directory, name1) if params[:podval][:tov1img]
    path2 = File.join(directory, name2) if params[:podval][:tov2img]
    path3 = File.join(directory, name3) if params[:podval][:tov3img]
    path4 = File.join(directory, name4) if params[:podval][:tov4img]
    path5 = File.join(directory, name5) if params[:podval][:tov5img]
    path6 = File.join(directory, name6) if params[:podval][:divup]
    path7 = File.join(directory, name7) if params[:podval][:divdown]

    File.open(path1, "wb") { |f| f.write(params[:podval][:tov1img].read) } if params[:podval][:tov1img]
    File.open(path2, "wb") { |f| f.write(params[:podval][:tov2img].read) } if params[:podval][:tov2img]
    File.open(path3, "wb") { |f| f.write(params[:podval][:tov3img].read) } if params[:podval][:tov3img]
    File.open(path4, "wb") { |f| f.write(params[:podval][:tov4img].read) } if params[:podval][:tov4img]
    File.open(path5, "wb") { |f| f.write(params[:podval][:tov5img].read) } if params[:podval][:tov5img]
    File.open(path6, "wb") { |f| f.write(params[:podval][:divup].read) } if params[:podval][:divup]
    File.open(path7, "wb") { |f| f.write(params[:podval][:divdown].read) } if params[:podval][:divdown]


    respond_to do |format|
      if @podval.save
        @podval.tov1img = name1[0..-5] if params[:podval][:tov1img]
        @podval.tov2img = name2[0..-5] if params[:podval][:tov2img]
        @podval.tov3img = name3[0..-5] if params[:podval][:tov3img]
        @podval.tov4img = name4[0..-5] if params[:podval][:tov4img]
        @podval.tov5img = name5[0..-5] if params[:podval][:tov5img]
        @podval.divup = name6[0..-5] if params[:podval][:divup]
        @podval.divdown = name7[0..-5] if params[:podval][:divdown]
        check_podval_cat1s
        @podval.save
        flash[:notice] = 'Сохранено.'
        format.html { redirect_to podvals_path }
      end
    end
  end

  # PUT /podvals/1
  # PUT /podvals/1.xml
  def update
    @podval = Podval.find(params[:id])
    name1 =  params[:podval][:tov1img].original_filename if params[:podval][:tov1img]
    name2 =  params[:podval][:tov2img].original_filename if params[:podval][:tov2img]
    name3 =  params[:podval][:tov3img].original_filename if params[:podval][:tov3img]
    name4 =  params[:podval][:tov4img].original_filename if params[:podval][:tov4img]
    name5 =  params[:podval][:tov5img].original_filename if params[:podval][:tov5img]
    name6 =  params[:podval][:divup].original_filename if params[:podval][:divup]
    name7 =  params[:podval][:divdown].original_filename if params[:podval][:divdown]
    directory = 'public/images/podval'

    path1 = File.join(directory, name1) if params[:podval][:tov1img]
    path2 = File.join(directory, name2) if params[:podval][:tov2img]
    path3 = File.join(directory, name3) if params[:podval][:tov3img]
    path4 = File.join(directory, name4) if params[:podval][:tov4img]
    path5 = File.join(directory, name5) if params[:podval][:tov5img]
    path6 = File.join(directory, name6) if params[:podval][:divup]
    path7 = File.join(directory, name7) if params[:podval][:divdown]

    File.open(path1, "wb") { |f| f.write(params[:podval][:tov1img].read) } if params[:podval][:tov1img]
    File.open(path2, "wb") { |f| f.write(params[:podval][:tov2img].read) } if params[:podval][:tov2img]
    File.open(path3, "wb") { |f| f.write(params[:podval][:tov3img].read) } if params[:podval][:tov3img]
    File.open(path4, "wb") { |f| f.write(params[:podval][:tov4img].read) } if params[:podval][:tov4img]
    File.open(path5, "wb") { |f| f.write(params[:podval][:tov5img].read) } if params[:podval][:tov5img]
    File.open(path6, "wb") { |f| f.write(params[:podval][:divup].read) } if params[:podval][:divup]
    File.open(path7, "wb") { |f| f.write(params[:podval][:divdown].read) } if params[:podval][:divdown]


    respond_to do |format|
      if @podval.update_attributes(params[:podval])
        @podval.tov1img = name1[0..-5] if params[:podval][:tov1img]
        @podval.tov2img = name2[0..-5] if params[:podval][:tov2img]
        @podval.tov3img = name3[0..-5] if params[:podval][:tov3img]
        @podval.tov4img = name4[0..-5] if params[:podval][:tov4img]
        @podval.tov5img = name5[0..-5] if params[:podval][:tov5img]
        @podval.divup = name6[0..-5] if params[:podval][:divup]
        @podval.divdown = name7[0..-5] if params[:podval][:divdown]
        @podval.save
        flash[:notice] = 'Сохранено.'
        format.html { redirect_to podvals_path }
      end
    end
  end

  # DELETE /podvals/1
  # DELETE /podvals/1.xml
  def destroy
    @podval = Podval.find(params[:id])
    @podval.destroy

    respond_to do |format|
      format.html { redirect_to(podvals_url) }
      format.xml  { head :ok }
    end
  end

  def main_podval
    @not_main_podvals = Podval.find(:all)
    @not_main_podvals.each do |podval|
      podval.update_attributes(:main => 0)
    end

    @main_podval = Podval.find(params[:id])
    @main_podval.update_attributes(:main => 1)
    redirect_to( podvals_path )
  end

  def random_podval
    @podvals = Podval.find(:all)
    @podvals.each do |podval|
      podval.update_attributes(:main => 0)
    end
    redirect_to( podvals_path )
  end

  def set_visible
    @podval = Podval.find(params[:id])
    check_podval_cat1s
    @podval.save
    redirect_to( podvals_path )
  end

  def set_unvisible
    @podval = Podval.find(params[:id])
    @podval.vis = 0
    @podval.save
    redirect_to( podvals_path )
  end

  def check_podval_cat1s
    @cat1 = Cat1.find(@podval.tov1_id)
    @cat2 = Cat1.find(@podval.tov2_id)
    @cat3 = Cat1.find(@podval.tov3_id)
    @cat4 = Cat1.find(@podval.tov4_id)
    @cat5 = Cat1.find(@podval.tov5_id)
    if @cat1.vis == 0 || @cat1.spb == 0 || @cat1.msk == 0
      redirect :back, :notice => "Подвал не может быть видимым, т.к. один из товаров недоступен"
    elsif @cat2.vis == 0 || @cat2.spb == 0 || @cat2.msk == 0
      redirect :back, :notice => "Подвал не может быть видимым, т.к. один из товаров недоступен"
    elsif @cat3.vis == 0 || @cat3.spb == 0 || @cat3.msk == 0
      redirect :back, :notice => "Подвал не может быть видимым, т.к. один из товаров недоступен"
    elsif @cat4.vis == 0 || @cat4.spb == 0 || @cat4.msk == 0
      redirect :back, :notice => "Подвал не может быть видимым, т.к. один из товаров недоступен"
    elsif @cat5.vis == 0 || @cat5.spb == 0 || @cat5.msk == 0
      redirect :back, :notice => "Подвал не может быть видимым, т.к. один из товаров недоступен"
    else
      @podval.vis = 1
    end
  end
end
