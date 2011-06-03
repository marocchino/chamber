class ChaptersController < ApplicationController
  expose(:book)
  expose(:chapters) { book.chapters.all }
  expose(:chapter)
  # GET /chapters
  # GET /chapters.xml
  def index
  end

  # GET /chapters/1
  # GET /chapters/1.xml
  def show
  end

  # GET /chapters/new
  # GET /chapters/new.xml
  def new
  end

  # GET /chapters/1/edit
  def edit
  end

  # POST /chapters
  # POST /chapters.xml
  def create

    respond_to do |format|
      if @chapter.save
        format.html { redirect_to(@chapter, :notice => 'Chapter was successfully created.') }
        format.xml  { render :xml => @chapter, :status => :created, :location => @chapter }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @chapter.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /chapters/1
  # PUT /chapters/1.xml
  def update

    respond_to do |format|
      if @chapter.update_attributes(params[:chapter])
        format.html { redirect_to(@chapter, :notice => 'Chapter was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @chapter.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /chapters/1
  # DELETE /chapters/1.xml
  def destroy
    @chapter.destroy

    respond_to do |format|
      format.html { redirect_to(chapters_url) }
      format.xml  { head :ok }
    end
  end
end
