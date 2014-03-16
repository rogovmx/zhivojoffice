class ChildrenContestsController < ApplicationController
  layout 'search_nofoot'
  before_filter :authorize, :except => [:kotiki]
  before_filter :redaktor, :except => [:kotiki]

  def index
    @children_contests = ChildrenContest.find :all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @children_contests }
    end
  end
  
  def new
    @children_contest = ChildrenContest.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @children_contest }
    end
  end

  def update
    @children_contest = ChildrenContest.find(params[:id])
    name =  params[:children_contest][:image].original_filename if params[:children_contest][:image]
    directory = 'public/images/cat_images'

    path = File.join(directory, name) if params[:children_contest][:image]

    if params[:children_contest][:image].instance_of?(Tempfile)
      FileUtils.cp(params[:children_contest][:image].local_path, path)
    else
      File.open(path, "wb") { |f| f.write(params[:children_contest][:image].read) } if params[:children_contest][:image]
    end

    respond_to do |format|
      if @children_contest.update_attributes(params[:children_contest])
        @children_contest.image = name if params[:children_contest][:image]
        @children_contest.save
        format.html { redirect_to(children_contests_path, :notice => 'Участник обновлен') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @children_contest.errors, :status => :unprocessable_entity }
      end
    end
  end

  def create
    @children_contest = ChildrenContest.new(params[:children_contest])
    name =  params[:children_contest][:image].original_filename if params[:children_contest][:image]
    directory = 'public/images/cat_images'

    path = File.join(directory, name) if params[:children_contest][:image]

    if params[:children_contest][:image].instance_of?(Tempfile)
      FileUtils.cp(params[:children_contest][:image].local_path, path)
    else
      File.open(path, "wb") { |f| f.write(params[:children_contest][:image].read) } if params[:children_contest][:image]
    end

    respond_to do |format|
      if @children_contest.save
        @children_contest.image = name if params[:children_contest][:image]
        @children_contest.save
        format.html { redirect_to(children_contests_path, :notice => 'Участник добавлен') }
        format.xml  { render :xml => @children_contest, :status => :created, :location => @children_contest }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @children_contest.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit
    @children_contest = ChildrenContest.find(params[:id])
  end

  def destroy
    @children_contest = ChildrenContest.find(params[:id])
    @children_contest.destroy

    respond_to do |format|
      format.html { redirect_to(children_contests_url) }
      format.xml  { head :ok }
    end
  end
  
  def kotiki
    render :layout => 'contest'
    @cats = ChildrenContest.find(:all)
  end

end